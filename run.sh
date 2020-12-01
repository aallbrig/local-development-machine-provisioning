function setup_osx {
  echo "OSX detected!"

  # homebrew "meta" role requires sudo pass
  # More info: https://github.com/geerlingguy/ansible-role-homebrew/issues/73
  ansible-playbook setup-scripts/setup-machine.yml -K -vv

  exit 0
}

case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*) setup_osx ;;
  linux*) echo "LINUX" ;;
  bsd*) echo "BSD" ;;
  msys*) echo "windows" ;;
  *) echo "unknown: $OSTYPE" ;;
esac
