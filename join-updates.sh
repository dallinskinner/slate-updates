#!/bin/sh
# One-time setup for installs made before Slate 0.2 (Agate): connect to the Slate update
# server and install slate-desktop. Run:  curl -fsSL https://dallinskinner.github.io/slate-updates/join-updates.sh | sudo sh
set -e
[ "$(id -u)" = 0 ] || { echo "run with sudo"; exit 1; }
curl -fsSL "https://dallinskinner.github.io/slate-updates/slate-archive-keyring.gpg" -o /usr/share/keyrings/slate-archive-keyring.gpg
cat > /etc/apt/sources.list.d/slate-join.sources <<SRC
Types: deb
URIs: https://dallinskinner.github.io/slate-updates/
Suites: stable
Components: main
Signed-By: /usr/share/keyrings/slate-archive-keyring.gpg
SRC
apt-get update
apt-get install -y slate-desktop
echo "Slate updates are on. Log out and back in to see theme changes."
