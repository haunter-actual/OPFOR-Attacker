#!/bin/bash

set -e

VENV_HOME="$HOME/venvs"

activate() {
    source "$VENV_HOME/$1/bin/activate"
    echo "[*] Activated venv: $1"
}

install_nxc() {
    echo ""
    echo "[*] Installing NetExec into nxc venv..."
    activate nxc

    # Fix OpenSSL compatibility
    pip install --upgrade pip setuptools wheel
    pip install "pyopenssl==24.0.0" "cryptography==42.0.8"

    pip install git+https://github.com/Pennyw0rth/NetExec.git

    deactivate
}

install_impacket() {
    echo ""
    echo "[*] Installing Impacket into impacket venv..."
    activate impacket

    pip install --upgrade pip setuptools wheel
    pip install git+https://github.com/fortra/impacket.git

    deactivate
}

install_certipy() {
    echo ""
    echo "[*] Installing Certipy into certipy venv..."
    activate certipy

    pip install --upgrade pip setuptools wheel

    # pin correct dependencies to avoid breakage
    pip install "pyopenssl==24.0.0" "cryptography==42.0.8"

    pip install certipy-ad

    deactivate
}

install_bloodhound() {
    echo ""
    echo "[*] Installing BloodHound.py into bloodhound venv..."
    activate bloodhound

    pip install --upgrade pip setuptools wheel
    pip install bloodhound

    deactivate
}

install_pkinit() {
    echo ""
    echo "[*] Installing PKINITtools into pkinit venv..."
    activate pkinit

    pip install --upgrade pip setuptools wheel cryptography pyopenssl

    git clone https://github.com/dirkjanm/PKINITtools.git /tmp/PKINITtools
    cd /tmp/PKINITtools
    pip install .

    cd -
    deactivate
}

install_misc() {
    echo ""
    echo "[*] Installing miscellaneous common pentest libraries..."
    activate misc

    pip install --upgrade pip setuptools wheel
    pip install rich tqdm ipython requests ldap3 pyasn1

    deactivate
}

echo "[+] Starting full tool installation..."

install_nxc
install_impacket
install_certipy
install_bloodhound
install_pkinit
install_misc

echo ""
echo "[+] All tools installed successfully!"
echo ""
echo "Use them like:"
echo "  source ~/venvs/nxc/bin/activate && nxc smb 10.10.10.5 -u user -p pass"
echo ""
echo "You're ready to go."
