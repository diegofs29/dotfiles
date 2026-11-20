autoload -U colors && colors
autoload -Uz vcs_info add-zsh-hook
setopt prompt_subst

# Git
# Rama Git: Blue (%F{4}) | Acción: Red (%F{1})
zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{4}%b%f'
zstyle ':vcs_info:git:*' actionformats ' %F{4}%b%F{1}|%a%f'

# Control de salto de línea inicial y limpieza
typeset -g _prompt_first=1
typeset -g _prompt_newline=""

_prompt_precmd() {
  vcs_info

  if (( _prompt_first )); then
    _prompt_newline=""
    _prompt_first=0
  else
    _prompt_newline=$'\n'
  fi
}

# Evita la línea vacía tras ejecutar `clear` o `reset`
_prompt_preexec() {
  case "$1" in
    clear|clear\ *|reset)
      _prompt_first=1
      ;;
  esac
}

# Evita la línea vacía al pulsar Ctrl+L (clear-screen)
_prompt_clear_screen() {
  local saved_newline="$_prompt_newline"
  _prompt_newline=""
  zle .clear-screen
  _prompt_newline="$saved_newline"
}
zle -N clear-screen _prompt_clear_screen

add-zsh-hook precmd _prompt_precmd
add-zsh-hook preexec _prompt_preexec

# --- Prompt final ---
# - Hora: Mauve (%F{13})
# - Usuario@Host: Peach / Naranja (%F{3})
# - Directorio: Subtext / Claro (%F{7})
# - Git: Rama (%F{4}), Acción (%F{1})
# - Código de salida != 0: Rojo (%F{1}) en λ
# - Símbolo de entrada: Lambda (λ) Green / Teal (%F{10})
PROMPT='${_prompt_newline}%F{13}[%T]%f %F{3}%n@%m%f %F{7}%~%f${vcs_info_msg_0_}
%B%(?.%F{10}.%F{1})λ%f%b '