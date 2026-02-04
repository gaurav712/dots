[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export PATH="$HOME/.local/bin:$HOME/.local/scripts:$PATH"
export QT_QPA_PLATFORM=xcb

# Android
export ANDROID_HOME="$HOME/Android/Sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

alias undervolt_cpu="sudo amdctl -gmc 0 -v 84 -f 168 -p 0"

# OpenCL AMD
export ROCM_PATH=/opt/rocm
export HSA_OVERRIDE_GFX_VERSION=10.3.0

### nnn colorscheme
BLK="00"       # background / block device
CHR="00"       # char device
DIR="03"       # yellow directories
EXE="02"       # green executables
REG="07"       # normal files
HARDLINK="02"  # green
SYMLINK="06"   # aqua
MISSING="01"   # red
ORPHAN="09"    # bright red
FIFO="02"      # green
SOCK="02"      # green
OTHER="05"     # purple

export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
