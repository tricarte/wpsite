#!/usr/bin/env bash

# https://stackoverflow.com/questions/5302650/multi-level-bash-completion

function build_reply() {
  if [ ! $? ]; then
    COMPREPLY=($(compgen -W "$($FD wpstarter.json --max-depth 2 --type f --base-directory $SITESDIR --color never --exec dirname)" -- $cur))
  else
    COMPREPLY=($(compgen -W "$(find $SITESDIR/ -maxdepth 2 -type f -name wpstarter.json -exec dirname {} \; | xargs -i basename {})" -- $cur))
  fi
  # COMPREPLY=($( compgen -W "$(ls ~/sites/)" -- $cur ) )
}

# have wpsite &&
_wpsite_complete() {
  local cur prev

  FD=$(command -v fd)

  # FIXME: These are hardcoded.
  if [[ -z "${SITESDIR}" ]]; then
    SITESDIR="$HOME/sites"
  fi

  if [[ -z "${BACKUPSDIR}" ]]; then
    BACKUPSDIR="$HOME/backups/sites/"
  fi

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD - 1]}

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=($(compgen -W "create backup delete restore rename update lang list quick admin boilerplate clone-repo last fm install-theme install-plugin woo settings flush-env config testdb env upgrade rest tmpadmin" -- $cur))
  elif [ "$COMP_CWORD" -ge 2 ]; then
    case "$prev" in
    "delete" | "backup" | "lang" | "admin" | "fm" | "rename" | "install-theme" | "install-plugin" | "flush-env" | "env" | "settings" | "rest" | "tmpadmin")
      build_reply
      ;;
    "restore")
      COMPREPLY=($(compgen -W "$(ls $BACKUPSDIR)" -- $cur))
      ;;
    *)
      build_reply
      ;;
    esac
  fi

  return 0
}
complete -F _wpsite_complete wpsite
complete -F _wpsite_complete wps
