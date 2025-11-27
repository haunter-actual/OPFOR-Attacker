# --- Pentest Tool venv shortcuts ---
export VENV_HOME="$HOME/venvs"

workon() {
    if [ -d "$VENV_HOME/$1" ]; then
        source "$VENV_HOME/$1/bin/activate"
        echo "[*] Activated venv: $1"
    else
        echo "[!] No such venv: $1"
    fi
}

deact() {
    deactivate 2>/dev/null || true
}

# Fast activation
alias nxcenv="workon nxc"
alias impacketenv="workon impacket"
alias certipyenv="workon certipy"
alias bloodhoundenv="workon bloodhound"
alias pkinitenv="workon pkinit"
alias miscenv="workon misc"

# Shortcut tool commands
alias nxc="source $VENV_HOME/nxc/bin/activate && nxc"
alias certipy="source $VENV_HOME/certipy/bin/activate && certipy"
alias gettgtpkinit="source $VENV_HOME/pkinit/bin/activate && python3 ~/venvs/pkinit_tools/gettgtpkinit.py"
