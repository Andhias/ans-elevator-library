@echo off
cd /d C:\Users\Andhias\Documents\elevator-cloud\github-pages-full

echo Checking GitHub login...
gh auth status || gh auth login

for /f "delims=" %%i in ('gh api user --jq ".login"') do set GH_USER=%%i
echo GitHub user: %GH_USER%

if not exist .git git init
git branch -M main
git add -A
git commit -m "initial online elevator library" || echo Nothing to commit

gh repo view %GH_USER%/ans-elevator-library >nul 2>&1 || gh repo create ans-elevator-library --public --description "ANS Elevator Library online catalog" --source . --remote origin

git remote get-url origin >nul 2>&1 || git remote add origin https://github.com/%GH_USER%/ans-elevator-library.git
git push -u origin main

echo Enabling GitHub Pages from main branch root...
gh api repos/%GH_USER%/ans-elevator-library/pages -X POST -f source[branch]=main -f source[path]=/ || gh api repos/%GH_USER%/ans-elevator-library/pages -X PUT -f source[branch]=main -f source[path]=/

echo Done.
echo Catalog URL: https://%GH_USER%.github.io/ans-elevator-library/catalog.json
pause
