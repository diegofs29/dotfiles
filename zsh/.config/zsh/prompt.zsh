autoload -U colors && colors
autoload -Uz vcs_info
setopt prompt_subst

# Git
# Rama Git: Blue (%F{4}) | Acción: Red (%F{1})
zstyle ':vcs_info:git:*' enable git
zstyle ':vcs_info:git:*' formats ' %F{4}%b%f'
zstyle ':vcs_info:git:*' actionformats ' %F{4}%b%F{1}|%a%f'

# Actualizar info
precmd() { vcs_info }

# Prompt final
# - Hora: Mauve (%F{13})
# - Usuario@Host: Peach / Naranja (%F{3})
# - Directorio: Subtext / Claro (%F{7})
# - Símbolo de entrada: Lambda (λ) Green / Teal (%F{10})
PROMPT='
%F{13}[%T]%f %F{3}%n@%m%f %F{7}%~%f${vcs_info_msg_0_}
%B%F{10}λ%f%b '