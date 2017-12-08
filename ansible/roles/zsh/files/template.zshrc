export POWERLINE_ROOT=$(pip show powerline-status | grep Location | cut -d: -f2 | tr -d " ")
. ${POWERLINE_ROOT}/powerline/bindings/zsh/powerline.zsh
