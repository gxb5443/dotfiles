echo
echo "Installing and Configuring Git..."

brew install git

PRIMARY_EMAIL="biondimeister@gmail.com"

git config --global user.name "Gianfranco Biondi"
git config --global user.email $PRIMARY_EMAIL

echo "Generating SSH Key for github..."
ssh-keygen -t ed25519 -C $PRIMARY_EMAIL
eval "$(ssh-agent -s)"
touch ~/.ssh/config
cat <<EOT >> ~/.ssh/config
Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
EOT
ssh-add -K ~/.ssh/id_ed25519

echo "Git ready!"
