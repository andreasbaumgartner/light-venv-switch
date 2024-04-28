# automaticly activate venv if exist and prompt a message
export function cd() {
  builtin cd "$@"
  local message_activ="👉 Virtualenv activated 🚀"
  local message_deactiv="👉 Virtualenv deactivated 🤓"
  local message=true

  # activate
  if [[ -z "$VIRTUAL_ENV" ]] ; then
      if [[ -d ./venv ]] ; then
        source ./venv/bin/activate
        if [[ $message == true ]] ; then
          echo $message_activ
        fi
      fi

  # deactive
  else
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
        if [[ $message == true ]] ; then
          echo $message_deactiv
        fi
      fi
  fi
}
