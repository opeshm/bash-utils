# Bash Utils

This project allows you to configure custom functions and script for bash.

# Install

Just clone this repository in your home directory and execute the install script: 
```bash
git clone https://gitlab.com/opeshm/bash-utils.git ~/.bash-utils
~/.bash-utils/install.sh
```

# Create new util folder

`bu-create-utils-project`

This function create a new utils proyect in `$HOME/.bash-utils/utils/`. It will create the following folder structure:
```
.
|____new-bu-utils-project
| |____functions
| | |____default.sh
| |____scripts
| | |____new-bu-utils-project
```

## Util project folders

- `functions`: All files withing this folder will be load in your profile, so every function declared in those files will be accesible.
- `scripts`: This path will be added to you $PATH env var, so every script you allocate here, will be accesible.

# Reload profile

To reload your bash profile, just execute this functions:
`bu-reload`
