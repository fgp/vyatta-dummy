#!/bin/bash
set -e

version="$1"

if [ "$nextversion" = "" ]; then
	echo "Usage: $0 <version>" >&2
fi

test "$(git status -s | wc -l)" = "0" || exit 1

git-dch --new-version="$version" --release
git add debian/changelog
git commit
git-buildpackage --git-tag
