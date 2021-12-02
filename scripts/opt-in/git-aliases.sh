echo
echo "Setting up Git Aliases..."

git config --global alias.lg "log --color --graph
--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold
blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.unstage "reset HEAD --"

echo "Git Aliases configured!"
