#!/bin/bash

setup_osx() {
  echo "OSX detected!"

  # Python package manager is used to install ansible
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
      echo "Ansible could not be installed using pip. Consult a search engine"
    fi
  fi
  ansible-galaxy install -r setup-scripts/requirements.yml

  exit 0
}

setup_ubuntu() {
  ansible --version
  if [[ $? != 0 ]] ; then
    echo "Ansible is not installed. Installing..."
    sudo apt install ansible
  fi

  ansible-galaxy install -r setup-scripts/requirements.yml

  exit 0
}

setup_windows() {
  ansible --version
  if [[ $? != 0 ]] ; then
    echo "No valid ansible installed.  Installing..."
    pip install ansible
    if [[ $? != 0 ]] ; then
      echo "Ansible could not be installed using pip. Consult a search engine"
    fi
  fi

  ansible-galaxy install -r setup-scripts/requirements.yml

  exit 0
}

case "$OSTYPE" in
  solaris*) echo "SOLARIS" ;;
  darwin*) setup_osx ;;
  # Hard coding assumption that linux = ubuntu
  # TODO: Update to support more linux distros
  linux*) setup_ubuntu ;;
  bsd*) echo "BSD" ;;
  msys*) setup_windows ;;
  *) echo "unknown: $OSTYPE" ;;
esac
