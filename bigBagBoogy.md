# instant push copy paste all below in one go:

git init
git branch -M main
git add .
git commit -m "amended code"
git push -u origin main

# remove: (for example node_modules)!

git rm -r --cached node_modules

# issue:

The background svg's dont have the path element
They have a <circle> element and in some cases a <gradient>
