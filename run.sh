function setup_osx {
  echo "osx"

  # Prerequisites
  pip --version
  if [[ $? != 0 ]] ; then
    echo "No valid pip installed.  Installing..."
    easy_install pip
  fi
  ansible --version
  if [[ $? != 0 ]] ; then
    echo "No valid ansible installed.  Installing..."
    pip install ansible
  fi
  ansible-galaxy install -r provisioning/requirements.yml
  if [[ $? != 0 ]] ; then
    echo "Try \`sudo ansible-galaxy install -r provisioning/requirements.yml\`"
    exit 0
  fi

  # Primary ansible entrypoint
  ansible-playbook provisioning/setup-machine.yml --ask-sudo-pass
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
