#!/bin/bash

default_path=${HOME}/zettelkasten
zettelkasten_path=${ZETTELKASTENPATH:-${default_path}}
zettelkasten_path="$(readlink -m ${zettelkasten_path})"

_get_zet_dirs()
{
  if [ -z "${ZETTELKASTEN_KAESTEN}" ]; then
    for dir in $(find "${zettelkasten_path}" -mindepth 1 -maxdepth 1 -type d -iname '[^.]*')
    do
      basename "${dir}"
    done
  else
    echo "${ZETTELKASTEN_KAESTEN}"
  fi
}

_get_zettel()
{
  local kasten=${1}
  for filepath in `find "${zettelkasten_path}/${kasten}" -type f -not -iname 'readme*'`
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
      COMPREPLY=($(compgen -W "init update edit preview filesearch textsearch new-kasten add-image" -- ${cur}))
      ;;
    2)
      local action="${COMP_WORDS[1]}"
      if [ "${action}" == "preview" ]; then
        _filedir
      else
        COMPREPLY=($(compgen -W "$(_get_zet_dirs)" -- ${cur}))
      fi
      ;;
    3)
      local action="${COMP_WORDS[1]}"
      local kasten="${COMP_WORDS[2]}"

      case ${action} in
        edit)
          COMPREPLY=($(compgen -W "$(_get_zettel ${kasten})" -- ${cur}))
          ;;
        add-image)
          _filedir '@(png|jpg|jpeg)'
          ;;
      esac
      ;;
    *)
      COMPREPLY=()
      ;;
  esac
}

complete -F _zet zet
