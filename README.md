# nb

…or create a new repository on the command line
echo "# nb" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main

git checkout -b new_branch

git remote add origin https://github.com/negash01/nb.git
git push -u origin main
                
…or push an existing repository from the command line
git remote add origin https://github.com/negash01/nb.git
git branch -M main
git push -u origin main
