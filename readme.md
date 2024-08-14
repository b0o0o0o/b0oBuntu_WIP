# b0oBUNTU


ADDSCREEN

#### This ansible playbook will make your machine lovely to use
Shamefully stolen there : https://github.com/laluka/lalubuntu

Start from [@TheLaluka](https://github.com/laluka)  config, cause i love the concept of `Lower The Friction` between you and your machine!

You can watch a demonstration of what his  `Lower The Friction`  is offering  below :

[![Lower The Friction](https://img.youtube.com/vi/xxOVNKNs24s/0.jpg)](https://www.youtube.com/watch?v=xxOVNKNs24s)

Note that:

	This playbook is only intended to be run in `Ubuntu 22.04`
	Around ADDSIZE of free space is needed for a full setup

## Sum-Up

The ansible playbook `main.yml` applies 3 ansible roles which are:

- roles/base-install
- roles/gui-tools
- roles/hardening

## Pre-Install, Install

```bash
# Pre-install
sudo apt install -y curl wget git vim tmux # Basics
git clone https://github.com/b0o0o0o/b0oBuntu_WIP
cd boobuntu
mv dots ~/Documents/
bash -x pre-install.sh  

# Main Install
bash -x install.sh
# If anything fails, the install won't be complete (ansible StopOnFail intended behavior)
# So you'll have to fix (or commment) the failing task and re-run install.sh!

```

## Install Specific Roles Only

Remember that `offensive-stuff` and `gui-tools` require `base-install`

```bash
# Only shell goodies
ansible-playbook -vvv -i inventory.ini --ask-become main.yml --tags base-install
# Smooth term & GUI for non-offensive folks -> requires base-install
ansible-playbook -vvv -i inventory.ini --ask-become main.yml --tags gui-tools
# Do the security thingy
ansible-playbook -vvv -i inventory.ini --ask-become main.yml --tags hardening
```

## Base install

Base-installs scripts will install all the needed sofware and packages

- This ansible script will first update and install a lot of needed packages. You can view all the packages in `default_packages` variable in `roles/base-install/defaults/main.yml` file
- Then, it will install and configure zsh (file is `zsh-config`)
- Then, the script will install mise (former RTX) and mise packages (`mise-all`)
- After, finishing the configuration of zsh with mise-en-place (file is `zsh-config-post-mise`)
- Then, some configuration of vim will be done (`vim-default`)
- Docker and docker compose will be installed (`docker-install`)
- Using fresh rust install, the script will install several tools using cargo (`cargo-dl`)
- A lil' bit of cleanup will be made (`cleanup`)

## Gui tools

Some GUI software such as vscode or office will be installed

- First, it installs common GUI softwares `install-gui-tools` (wireshark, vlc, obs...) (you can find all the packages in `gui_tools_to_install` (`roles/gui-tools/defaults/main.yml`))
- Then, it will installs google chrome (`install-google-chrome`)
- Then, install vscode (`install-vscode`)
- After, it will install and setup regolith (`setup-regolith`)
- To finish, some cleanup ! (`cleanup`)

## Hardening

Some quick hardening will be done :

- First, some ufw (firewall) config `ufw-setup`
- Then disabling some services (vars can be found `roles/hardening/defaults/main.yml`) `disable-service`
- Install (vars can be found `roles/hardening/defaults/main.yml`) `install-secu-packages`
- To finish, some cleanup ! (`cleanup`)


---

## Gotchas

- If you are lost, use `Mod+Shift+?` to open the bindings help panel!

