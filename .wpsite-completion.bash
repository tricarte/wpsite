#!/usr/bin/env bash

# https://stackoverflow.com/questions/5302650/multi-level-bash-completion

# have wpsite &&
_pbt_complete()
{
  local cur prev

  # FIXME: These are hardcoded.
  if [[ -z "${SITESDIR}" ]]; then
      SITESDIR="$HOME/sites"
  fi

  if [[ -z "${BACKUPSDIR}" ]]; then
      BACKUPSDIR="$HOME/backups/sites/"
  fi

  COMPREPLY=()
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "create backup delete restore update lang list quick admin boilerplate clone-repo" -- $cur) )
  elif [ "$COMP_CWORD" -eq 2 ]; then
    case "$prev" in
        # FIXME: This does not handle "wpsite delete site1 site2"
        # site2 will not be completed.
      "delete"|"backup"|"update"|"lang"|"admin")
          FD=$(command -v fd)
          if [ ! $? ]; then
              COMPREPLY=($( compgen -W "$($FD wpstarter.json --max-depth 2 --type f --base-directory $SITESDIR --color never --exec dirname)" -- $cur ) )
          else
              COMPREPLY=($( compgen -W "$(find $SITESDIR/ -maxdepth 2 -type f -name wpstarter.json -exec dirname {} \; | xargs -i basename {})" -- $cur ) )
          fi
        # COMPREPLY=($( compgen -W "$(ls ~/sites/)" -- $cur ) )
        ;;
      "restore")
        COMPREPLY=($( compgen -W "$(ls $BACKUPSDIR)" -- $cur ) )
        ;;
      *)
        ;;
    esac
  fi

  return 0
}
complete -F _pbt_complete wpsite
