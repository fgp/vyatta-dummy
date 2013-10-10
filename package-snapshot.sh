#!/bin/bash
set -e

nextversion="$1"

test "$(git status -s | wc -l)" = "0" || exit 1

if [ "$nextversion" != "" ]; then
	git-dch --new-version="$nextversion" --auto --snapshot
else
	git-dch --auto --snapshot
fi
git add debian/changelog
git commit
git-buildpackage
