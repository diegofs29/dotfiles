# Usa $ZDOTDIR, si no se define, entonces $HOME
zstyle :compinstall filename "${ZDOTDIR:-$HOME}/.zshrc"

# Configuración extendida de autocompletado
zstyle ':completion:*' menu select                        # Menú interactivo navegable
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Autocompletado insensible a mayúsculas/minúsculas
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # Colores en el menú basados en ls

autoload -Uz compinit

# Optimización de carga
ZCOMPDUMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/zcompdump"
mkdir -p "${ZCOMPDUMP:h}"

if [[ -n ${ZCOMPDUMP}(#qN.m+1) ]]; then
  compinit -d "$ZCOMPDUMP"
else
  compinit -C -d "$ZCOMPDUMP"
fi