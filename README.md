### Local Development Machine Setup
The goal with this repo is to be able to provision a new laptop or sync an existing laptop with the setup required to make any development simple.

### Getting Started
In a shell (or shell emulator) run `sh run.sh`.  You will be asked a series of questions, for example:

```
Configure laptop (y/n)? [n]: 
Configure developer software (y/n)? [n]: 
Configure operations software (y/n)? [n]: 
Configure chat ops software (y/n)? [n]: 
Configure general user software (y/n)? [n]: 
Configure artist software (y/n)? [n]: 
Configure arduino software (y/n)? [n]: 
Configure 3d related software (y/n)? [n]: 
```

The default is "no", so press "enter" on the roles questions you wish to skip.

---

##### Tips & Tricks
* Ansible command to find out what OS you're recognized as:
  ```
  ansible all -m setup -a 'filter=ansible_distribution'
  ```
* Ansible global vars have a tendency to overwrite each other.  Isolating vars from each other is a very good idea if you have "magic" vars that cause roles to do something.  E.g. Consider the following two "example" files:
  ```
  # Example vars/main.yml
  ---
  common:
    # Normally these vars are overridden by other roles
    homebrew_taps:
     - caskroom/versions
    homebrew_installed_packages:
     - mysql
    homebrew_cask_apps:
     - java
  ```
  ```
  # Example meta/main.yml
  ---
  dependencies:
    - {
        role: geerlingguy.homebrew,
        homebrew_taps: "{{common.homebrew_taps}}",
        homebrew_installed_packages: "{{common.homebrew_installed_packages}}",
        homebrew_cask_apps: "{{common.homebrew_cask_apps}}"
      }
  ```
