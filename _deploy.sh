#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "nicolas.csanchez@gmail.com"
git config --global user.name "Nicolas Sanchez"

git clone -b gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG}.git book-output
"A"
cd book-output
"B"
cp -r ../_book/* ./
"C"
git add --all *
"D"
git commit -m"Update the book" || true
"E"
git push -q origin gh-pages
