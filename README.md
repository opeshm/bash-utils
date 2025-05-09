# Bash Utils

This project allows you to configure custom functions and script for bash.

[Bash Utils](https://gitlab.com/opeshm/bash-utils.git)

# Install

Just clone this repository in your home directory and execute the install script:
```bash
git clone https://gitlab.com/opeshm/bash-utils.git ~/.bash-utils
~/.bash-utils/install.sh
```

# New util folder

There is a function available to create a new util project: `bu-create-utils-project`

This function create a new utils project in `$HOME/.bash-utils/utils/`. It will create the following folder structure:
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

# Cloning util project

If you have a previous util project, you can clone it with the function `bu-add-util-project`
```bash
bu-add-utils-project <git-repo-url>
```
Change the string <git-repo-url> and replace it with the right repository clone url.

# Reload profile

To reload your bash profile, just execute this functions:
```bash
bu-reload
```
