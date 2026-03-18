#!/bin/bash

SCHEME=~/.config/hypr/scheme/current.conf
get_color() {
    grep "^\$$1 " "$SCHEME" | cut -d'=' -f2 | tr -d ' '
}

BG=$(get_color base)
BG_ALT=$(get_color surfaceContainerLow)
FG=$(get_color text)
ACCENT=$(get_color primary)
DIM=$(get_color subtext0)

THEME=$(mktemp /tmp/keybinds-XXXXXX.rasi)
cat > "$THEME" << EOF
* {
    bg:     #${BG};
    bg-alt: #${BG_ALT};
    fg:     #${FG};
    accent: #${ACCENT};
    dim:    #${DIM};
    font:   "CaskaydiaCove Nerd Font 11";
}
window {
    background-color: @bg;
    border:           2px solid;
    border-color:     @accent;
    border-radius:    20px;
    width:            1500px;
    height:           700px;
    padding:          20px;
}
mainbox { background-color: transparent; spacing: 12px; }
inputbar { background-color: @bg-alt; border-radius: 14px; padding: 10px 16px; }
prompt { background-color: transparent; text-color: @accent; padding: 0 10px 0 0; }
entry { background-color: transparent; text-color: @fg; placeholder: "Search keybinds..."; placeholder-color: @dim; }
listview { background-color: transparent; columns: 3; lines: 14; scrollbar: false; spacing: 6px; flow: horizontal; }
element { background-color: @bg-alt; border-radius: 12px; padding: 10px 14px; }
element selected { background-color: @accent; text-color: @bg; }
element-text { background-color: transparent; text-color: @fg; }
element selected element-text { text-color: @bg; }
EOF

keybinds="󰣇  Super + Enter              Open Terminal
󰖟  Super + W                  Open Browser
󰨞  Super + C                  Open Editor
󰉋  Super + E                  Open File Manager
󰅖  Super + Q                  Close Window
󰖯  Super + F                  Fullscreen
󰖲  Super + Alt + F            Fullscreen with Borders
󰉄  Super + Alt + Space        Float Window
󰹑  Super + Z                  Move Window (drag)
󰔡  Super + X                  Resize Window (drag)
󰆊  Super + P                  Pin Window
  Super + Left/Right/Up/Down  Move Focus
󰜶  Super + Shift + ←→↑↓      Move Window
󰔲  Super + - / =              Resize Horizontal
󰔲  Super + Shift - / =        Resize Vertical
󰁌  Ctrl + Super + →           Next Workspace
󰁍  Ctrl + Super + ←           Prev Workspace
󰡛  Super + 1-9                Go to Workspace
󰆑  Super + Alt + 1-9          Move Win to Workspace
󰛢  Super + S                  Toggle Special WS
󰕮  Super + ,                  Toggle Group
󰁙  Alt + Tab                  Cycle Group Next
󰁊  Shift + Alt + Tab          Cycle Group Prev
󰜘  Super + U                  Ungroup Window
  Super + Shift + ,           Lock Group
󰕰  Super + V                  Clipboard (clipse)
󰮫  Super + .                  Emoji Picker
󰘳  Super + M                  Music Player
󰙯  Super + D                  Communication
󰝚  Super + R                  Todo
󰔩  Ctrl + Shift + Esc         System Monitor
󰍹  Super + K                  Show Panels
󰌾  Super + L                  Lock Screen
󰤄  Super + Shift + L          Sleep
󰐥  Ctrl + Alt + Delete        Session Menu
󰏘  Super + Shift + S          Screenshot Region (freeze)
  Print                      Screenshot Full
󰑊  Super + Alt + R            Record with Sound
󰒻  Ctrl + Alt + R             Record Screen
󰆕  Ctrl + Super + \\          Center Window
  Ctrl + Alt + C             Clear Notifications
󰔮  Super (tap)                App Launcher
  Super + /                  Keybind Cheatsheet
  Ctrl+Super + Space          Media Play/Pause
  Ctrl+Super + =              Media Next
  Ctrl+Super + -              Media Prev
  Super + Shift + C           Color Picker
  Super + Shift + M           Mute Audio"

echo "$keybinds" | rofi -dmenu \
    -p "⌨  Keybinds" \
    -theme "$THEME" \
    -no-custom \
    -format i

rm -f "$THEME"
