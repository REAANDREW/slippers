export POWERLINE_ROOT=$(pip show powerline-status | grep Location | cut -d: -f2 | tr -d " ")
. ${POWERLINE_ROOT}/powerline/bindings/zsh/powerline.zsh

export LANG="en_GB.UTF-8"
export LANGUAGE="en_GB.UTF-8"
export LC_ALL="en_GB.UTF-8"
