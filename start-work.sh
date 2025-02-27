#!/bin/bash

# ====================================================
# SCRIPT TO INITIALIZE SODEP WORKSPACE
# ====================================================

CHROME_CMD="google-chrome"
VSCODE_CMD="code"

CHROME_URLS=(
    "https://mail.google.com/mail/u/0/#chat/home"
    "https://claude.ai"
)

if ! command -v wmctrl &> /dev/null; then
    echo "Installing wmctrl..."
    sudo dnf install -y wmctrl
fi

change_work_space() {
    local space=$1
    wmctrl -s $((space - 1))
    echo "Switched to workspace $space"
    sleep 1
}

open_browser_with_urls() {
    local browser_cmd=$1
    shift
    local urls=("$@")
    
    if [ ${#urls[@]} -eq 0 ]; then
        $browser_cmd 2>/dev/null &
    else
        $browser_cmd "${urls[@]}" 2>/dev/null &
    fi
    
    sleep 3
}

clear
echo "Starting work environment..."

echo "Setting up workspace 1..."
change_work_space 1

echo "Launching Google Chrome..."
open_browser_with_urls "$CHROME_CMD" "${CHROME_URLS[@]}"

echo "Launching VSCode in the project directory..."
$VSCODE_CMD ~/Dev/interfisa-be-web &
sleep 3

echo "Work environment setup completed!"
