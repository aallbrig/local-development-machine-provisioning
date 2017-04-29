function setup_osx {
  echo "osx"

  # Prerequisites
  pip --version
  if [[ $? != 0 ]] ; then
    echo "No valid pip installed.  Installing..."
    easy_install pip
    if [[ $? != 0 ]] ; then
      echo "Sudoing easy_install pip"
      sudo easy_install pip
    fi
  fi
  ansible --version
  if [[ $? != 0 ]] ; then
    echo "No valid ansible installed.  Installing..."
    pip install ansible
    if [[ $? != 0 ]] ; then
      echo "Pip requires sudo?"
      sudo pip install ansible
    fi
  fi
  ansible-galaxy install -r provisioning/requirements.yml
  if [[ $? != 0 ]] ; then
    echo "Sudoing ansible-galaxy install -r provisioning/requirements.yml"
    sudo ansible-galaxy install -r provisioning/requirements.yml
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
