# BooBuntu

## Pre-install
```sh
sudo apt install -y curl wget git vim tmux # Basics
git clone https://github.com/laluka/lalubuntu
cd boobuntu
mv dots ~/Documents/
bash -x pre-install.sh
```

## Main Install
```sh
bash -x install.sh
# If anything fails, the install won't be complete (ansible StopOnFail intended behavior)
# So you'll have to fix (or commment) the failing task and re-run install.sh!
```
