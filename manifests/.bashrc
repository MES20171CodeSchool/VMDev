# *********************************************
# * ~/.bashrc Personalizado para Ubuntu       *
# * local: /home/user/.bashrc                 *
# *                                           *
# *********************************************
#-----------------------------------------------
# Configurações Gerais
#-----------------------------------------------
source ~/.bash_git

#============================================
# Eliases (apelidos diversos)
#============================================

alias config_bash="vim ~/.bashrc"
alias config_vim="vim ~/.vim/vimrc"
alias config_tmux="vim ~/.tmux.conf"
alias update="source ~/.bashrc"
alias date="date +'%d-%m-%Y, %H:%M'"
alias C="gcc -Wall -pedantic -ansi "
alias C++="g++ -Wall -pedantic -ansi "
alias open="nautilus ."
alias exitvenv="deactivate"

#============================================
# Comandos importantes para o terminal
#============================================

# NVM
export NVM_DIR="/home/victor/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Android Studio
export PATH="$PATH:$HOME/android-studio/bin"

#============================================
# Configuração do TMUX
#============================================

if [ "$TERM" = "xterm"  ]; then
    export TERM=xterm-256color
fi
alias tmux='tmux -2'  # for 256color
alias tmux='tmux -u'  # to get rid of unicode rendering problem

#============================================
# Colocar corer nos diretorios do terminal
#============================================

# altera a cor de exibição dos diretorios e arquivos
alias ls='ls --color'
# Define a variável de ambiente LS_COLORS com os valores entre aspas
LS_COLORS='di=1;34:ex=0'
# armazena na memória os valores da variável.
export LS_COLORS

#============================================
# Configurações referentes ao usuário
#============================================

## Verifica se é usuário root (EUID=0) ou usuário comum
if [[ ${EUID} == 0 ]] ; then
  PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\]:\W\$\[\033[00m\] '
else
  PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\W$(__git_ps1 "(%s)")$ '
fi

VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
source /usr/local/bin/virtualenvwrapper.sh
