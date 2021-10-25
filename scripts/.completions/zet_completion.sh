#!/bin/bash

get_zet_dirs()
{
  for dir in $(find ${HOME}/zettelkasten/ -mindepth 1 -maxdepth 1 -type d -iname '[^.]*')
  do
    basename "${dir}"
  done
}

_zet()
{
  local cur prev

  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  case ${COMP_CWORD} in
    1)
      COMPREPLY=($(compgen -W "update edit latest" -- ${cur}))
      ;;
    2)
      COMPREPLY=($(compgen -W "$(get_zet_dirs)" -- ${cur}))
      ;;
    *)
      COMPREPLY=()
      ;;
  esac
}

complete -F _zet zet
