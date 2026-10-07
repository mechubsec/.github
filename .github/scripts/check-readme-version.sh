#!/usr/bin/env bash
set -euo pipefail

# Validates a repo's README.md `<!-- mechub-version: ... -->` marker against
# its git tags:
#   - If a `v*` tag exists, the marker must equal the latest one exactly
#     (by version sort).
#   - If no `v*` tag exists yet, the marker must be exactly `unreleased`.
#   - A missing marker always fails, rather than being silently skipped.
#
# Deterministic by design: the marker is a single HTML-comment line, not
# something parsed out of free-form README prose.
#
# Usage: check-readme-version.sh [--readme PATH] [--repo DIR]
# Exit codes: 0 = match, 1 = mismatch or missing marker, 2 = usage error.

usage() {
  cat <<'EOF'
Usage: check-readme-version.sh [--readme PATH] [--repo DIR]

  --readme PATH   Path to the README to check (default: README.md)
  --repo DIR      Path to the git repository to read tags from (default: .)
EOF
}

readme="README.md"
repo="."

while [ $# -gt 0 ]; do
  case "$1" in
    --readme) readme="$2"; shift 2 ;;
    --repo) repo="$2"; shift 2 ;;
    -h|--help) usage; exit 0 ;;
    *) echo "unknown argument: $1" >&2; usage >&2; exit 2 ;;
  esac
done

if [ ! -f "$readme" ]; then
  echo "error: README not found at $readme" >&2
  exit 2
fi

marker=$(sed -n \
  's/.*<!--[[:space:]]*mechub-version:[[:space:]]*\([^[:space:]]*\)[[:space:]]*-->.*/\1/p' \
  "$readme" | head -1)

if [ -z "$marker" ]; then
  echo "error: no <!-- mechub-version: ... --> marker found in $readme" >&2
  echo "Add one near the top of the README, e.g.:" >&2
  echo "  <!-- mechub-version: v1.2.3 -->" >&2
  echo "  <!-- mechub-version: unreleased -->" >&2
  echo "See the marker convention in mechubsec/.github's README." >&2
  exit 1
fi

# versionsort.suffix=- ranks a pre-release tag (v1.2.3-rc1) below the final
# tag it precedes (v1.2.3), so a stray rc tag can't outrank a real release.
latest_tag=$(git -c versionsort.suffix=- -C "$repo" tag -l 'v*' --sort=-v:refname | head -1)

if [ -n "$latest_tag" ]; then
  if [ "$marker" != "$latest_tag" ]; then
    echo "error: README says $marker, latest tag is $latest_tag" >&2
    exit 1
  fi
  echo "ok: README marker $marker matches latest tag"
else
  if [ "$marker" != "unreleased" ]; then
    echo "error: README marker is '$marker' but no v* tag exists yet; expected 'unreleased'" >&2
    exit 1
  fi
  echo "ok: no tags yet, README marker is 'unreleased'"
fi
