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
