#!/usr/bin/env bash
set -euo pipefail
cd /c/Users/Andhias/Documents/elevator-cloud/github-pages-full

gh auth status || gh auth login
GH_USER=$(gh api user --jq '.login')
echo "GitHub user: $GH_USER"

[ -d .git ] || git init
git branch -M main
git add -A
git commit -m "initial online elevator library" || true

gh repo view "$GH_USER/ans-elevator-library" >/dev/null 2>&1 || gh repo create ans-elevator-library --public --description "ANS Elevator Library online catalog" --source . --remote origin
git remote get-url origin >/dev/null 2>&1 || git remote add origin "https://github.com/$GH_USER/ans-elevator-library.git"
git push -u origin main

echo "Enabling GitHub Pages from main branch root..."
gh api "repos/$GH_USER/ans-elevator-library/pages" -X POST -f 'source[branch]=main' -f 'source[path]=/' || gh api "repos/$GH_USER/ans-elevator-library/pages" -X PUT -f 'source[branch]=main' -f 'source[path]=/' || true

echo "Catalog URL: https://$GH_USER.github.io/ans-elevator-library/catalog.json"
