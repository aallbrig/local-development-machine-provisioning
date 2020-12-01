function setup_osx {
  echo "OSX detected!"

  # Ansible is built on top of python. PIP is used to install the bin file
  pip --version
  if [[ $? != 0 ]] ; then
    echo "No valid pip installed.  Installing..."
    easy_install pip
    if [[ $? != 0 ]] ; then
      echo "Sudoing easy_install pip"
      sudo easy_install pip
      if [[ $? != 0 ]] ; then
        echo "Could not install pip.  Not sure why... Copy the output error text and consult a search engine"
        exit 1
      fi
    fi
  fi

  # Install ansible
  ansible --version
  if [[ $? != 0 ]] ; then
    echo "No valid ansible installed.  Installing..."
    pip install ansible
    if [[ $? != 0 ]] ; then
      echo "Pip requires sudo?"
      sudo pip install ansible
      if [[ $? != 0 ]] ; then
        echo "Could not install ansible.  Not sure why... See if google knows?"
        exit 1
      fi
    fi
  fi
  ansible-galaxy install -r setup-scripts/requirements.yml
  if [[ $? != 0 ]] ; then
    echo "Sudoing ansible-galaxy install -r setup-scripts/requirements.yml"
    sudo ansible-galaxy install -r setup-scripts/requirements.yml
  fi

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
