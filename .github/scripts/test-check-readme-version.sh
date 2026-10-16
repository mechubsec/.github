#!/usr/bin/env bash
set -euo pipefail

# Fixture-based tests for check-readme-version.sh. No network, no real repo
# history: each case builds a throwaway git repo under a temp dir.

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
checker="$script_dir/check-readme-version.sh"

failures=0

make_repo() {
  local dir="$1"
  mkdir -p "$dir"
  git -C "$dir" init -q
  git -C "$dir" config user.email "test@example.invalid"
  git -C "$dir" config user.name "test"
  : > "$dir/placeholder"
  git -C "$dir" add placeholder
  git -C "$dir" commit -q -m "placeholder"
}

tag_repo() {
  local dir="$1" tag="$2"
  git -C "$dir" tag "$tag"
}

write_readme() {
  local dir="$1" marker="$2"
  if [ -n "$marker" ]; then
    printf '# title\n\n<!-- mechub-version: %s -->\n' "$marker" > "$dir/README.md"
  else
    printf '# title\n\nno marker here\n' > "$dir/README.md"
  fi
}

assert_exit() {
  local name="$1" expected="$2" dir="$3"
  local actual=0
  "$checker" --repo "$dir" --readme "$dir/README.md" >"$work/out" 2>&1 || actual=$?
  if [ "$actual" -ne "$expected" ]; then
    echo "FAIL: $name — expected exit $expected, got $actual"
    sed 's/^/    /' "$work/out"
    failures=$((failures + 1))
  else
    echo "ok: $name"
  fi
}

work="$(mktemp -d)"
trap 'rm -rf "$work"' EXIT

# 1. marker matches the latest tag.
d="$work/match"
make_repo "$d"
tag_repo "$d" v1.2.3
write_readme "$d" "v1.2.3"
assert_exit "marker matches latest tag" 0 "$d"

# 2. marker is stale relative to the latest tag.
d="$work/mismatch"
make_repo "$d"
tag_repo "$d" v1.2.3
write_readme "$d" "v1.0.0"
assert_exit "marker mismatches latest tag" 1 "$d"

# 3. no marker in the README at all.
d="$work/missing-marker"
make_repo "$d"
tag_repo "$d" v1.2.3
write_readme "$d" ""
assert_exit "missing marker fails" 1 "$d"

# 4. no tags yet, marker correctly says unreleased.
d="$work/unreleased-correct"
make_repo "$d"
write_readme "$d" "unreleased"
assert_exit "unreleased with no tags matches" 0 "$d"

# 5. a tag now exists but the marker still says unreleased.
d="$work/unreleased-stale"
make_repo "$d"
tag_repo "$d" v0.1.0
write_readme "$d" "unreleased"
assert_exit "unreleased marker once a tag exists fails" 1 "$d"

# 6. a pre-release tag must not outrank the final release it precedes.
d="$work/prerelease-does-not-outrank-release"
make_repo "$d"
tag_repo "$d" v0.19.0
tag_repo "$d" v0.19.0-rc1
write_readme "$d" "v0.19.0"
assert_exit "final release tag wins over its own rc" 0 "$d"

# 7. the workflow's embedded copy of the checker must stay byte-identical to
# this script, or the two would silently drift apart.
workflow="$script_dir/../workflows/readme-version.yml"
embedded="$work/embedded-check-readme-version.sh"
sed -n '/BEGIN_EMBEDDED_CHECKER$/,/END_EMBEDDED_CHECKER$/p' "$workflow" \
  | sed '1d;$d' \
  | sed 's/^ \{10\}//' \
  > "$embedded"
if diff -q "$checker" "$embedded" >/dev/null; then
  echo "ok: workflow's embedded checker matches check-readme-version.sh"
else
  echo "FAIL: workflow's embedded checker has drifted from check-readme-version.sh"
  diff -u "$embedded" "$checker" || true
  failures=$((failures + 1))
fi

if [ "$failures" -gt 0 ]; then
  echo "$failures test(s) failed"
  exit 1
fi
echo "all tests passed"
