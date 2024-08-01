die() {
  n="$1" ; shift ; >&2 printf "[%s] $(tput setaf 1)%s$(tput sgr0)\\n" "$( now )" "$*" ; exit "$n"
}
export -f die
log() {
  >&2 printf "[%s] $(tput setaf 2)%s$(tput sgr0)\\n" "$( now )" "$*"
}
export -f log
err() {
  >&2 printf "[%s] $(tput setaf 3)%s$(tput sgr0)\\n" "$( now )" "$*"
}
export -f err
big() {
  >&2 printf \\n###\\n#\\n#\ %s\\n#\\n###\\n\\n "$*"
}
export -f big
now() {
  # shellcheck disable=SC2120
  date -u "+%Y-%m-%dT%H:%M:%S" "$@" | sed 's/N/000000000/'
}
export -f now
