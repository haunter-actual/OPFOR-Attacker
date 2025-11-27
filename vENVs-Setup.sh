#!/bin/bash

set -e

echo "[*] Creating ~/venvs directory..."
mkdir -p ~/venvs

########################################
# NetExec VENV
########################################
echo "[*] Creating NetExec venv..."
python3 -m venv ~/venvs/nxc
source ~/venvs/nxc/bin/activate

echo "[*] Installing deps for NetExec..."
pip install --upgrade pip setuptools wheel
pip install pyopenssl==23.2.0 cryptography==41.0.3
pip install git+https://github.com/Pennyw0rth/NetExec.git

deactivate


########################################
# Certipy VENV
########################################
echo "[*] Creating Certipy venv..."
python3 -m venv ~/venvs/certipy
source ~/venvs/certipy/bin/activate

echo "[*] Installing Certipy..."
pip install --upgrade pip setuptools wheel
pip install certipy-ad

deactivate


########################################
# Impacket VENV
########################################
echo "[*] Creating Impacket venv..."
python3 -m venv ~/venvs/impacket
source ~/venvs/impacket/bin/activate

echo "[*] Installing Impacket..."
pip install --upgrade pip setuptools wheel
pip install git+https://github.com/fortra/impacket

deactivate


########################################
# PKINITtools VENV
########################################
echo "[*] Creating PKINITtools venv..."
python3 -m venv ~/venvs/pkinit
source ~/venvs/pkinit/bin/activate

echo "[*] Installing PKINITtools..."
pip install --upgrade pip setuptools wheel
pip install git+https://github.com/dirkjanm/PKINITtools

deactivate


########################################
# SHELL ALIASES
########################################
echo "[*] Adding aliases to ~/.zshrc and ~/.bashrc..."

ALIASES='
# Red Team Tool Virtual Environments
alias nxc="source ~/venvs/nxc/bin/activate && nxc"
alias certipy="source ~/venvs/certipy/bin/activate && certipy"
alias imp="source ~/venvs/impacket/bin/activate"
alias pkinit="source ~/venvs/pkinit/bin/activate"
'

echo "$ALIASES" >> ~/.zshrc
echo "$ALIASES" >> ~/.bashrc

echo "[+] Done!"
echo "[+] Run: source ~/.zshrc (or ~/.bashrc)"
echo "[+] Your environments are ready."
