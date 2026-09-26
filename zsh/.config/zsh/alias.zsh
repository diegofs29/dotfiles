alias ls='ls -F --color=auto'
alias ll='ls -lh --color=auto'
alias la='ls -lha --color=auto'
alias l.='ls -d .* --color=auto'

alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ip='ip -color=auto'

# Mostrar $PATH de forma legible
alias path='echo -e ${PATH//:/\\n}'

# Navigate up directories quickly
alias ..="cd .."
alias .2="cd ../../"
alias .3="cd ../../../"
alias .4="cd ../ navigation/../"
alias .5="cd ../ navigation/../../.."

# Create nested directories with verbose output
alias mkdir='mkdir -pv'

# --- Seguridad e interactividad (evita sobrescribir/borrar por error) ---
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# --- Información del sistema y red ---
alias free='free -m'                    # Muestra memoria en Megabytes
alias df='df -h'                        # Espacio en disco inteligible
alias ports='netstat -tulanp'           # Ver puertos abiertos (o usas ss -tulanp)

# --- EndeavourOS / Arch Linux (Pacman & Yay) ---
alias update='yay -Syu'                 # Actualiza todo el sistema (repo oficial + AUR)
alias cleanup='yay -Sc'                 # Limpia la caché de paquetes no instalados
alias orphan='yay -Qtdq | yay -Rns -'   # Elimina dependencias huérfanas
alias mirror='eos-rankmirrors'          # Herramienta propia de EndeavourOS para refrescar espejos

# --- Atajos de utilidad general ---
alias c='clear'
alias h='history'
alias reload='source ~/.zshrc'          # Recarga la configuración del shell al instante