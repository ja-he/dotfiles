#!/bin/bash

_get_zet_dirs()
{
  for dir in $(find ${HOME}/zettelkasten/ -mindepth 1 -maxdepth 1 -type d -iname '[^.]*')
  do
    basename "${dir}"
  done
}

_get_zettel()
{
  local kasten=${1}
  for filepath in `find ${HOME}/zettelkasten/${kasten} -type f -not -iname 'readme*'`
  do
    basename "${filepath}"
  done
}

_zet()
{
  local cur prev

  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  case ${COMP_CWORD} in
    1)
      COMPREPLY=($(compgen -W "update edit filesearch textsearch" -- ${cur}))
      ;;
    2)
      COMPREPLY=($(compgen -W "$(_get_zet_dirs)" -- ${cur}))
      ;;
    3)
      local action="${COMP_WORDS[1]}"
      local kasten="${COMP_WORDS[2]}"

      case ${action} in
        edit)
          COMPREPLY=($(compgen -W "$(_get_zettel ${kasten})" -- ${cur}))
          ;;
      esac
      ;;
    *)
      COMPREPLY=()
      ;;
  esac
}

complete -F _zet zet
