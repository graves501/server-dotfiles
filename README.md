# Server Dotfiles

[![Managed with GNU Stow](https://img.shields.io/badge/Managed%20with-GNU%20Stow-red.svg)](https://www.gnu.org/software/stow/)

Basic configuration files for `vim`, `bash` and `tmux`.

Main goal for this repository is to achieve a convenient way to manage Linux servers without giving up my usual workflow.

## Usage

Make sure to have `stow` installed.

If you're new to using `stow`, check out [this article](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/).

### Enable configuration
```bash
$ git clone https://github.com/graves501/server-dotfiles ~/.dotfiles 
$ cd ~/.dotfiles/stow_home
$ stow -t ~ [application name e.g. vim]
```

### Delete configuration

To remove the configuration of an application:
```bash
$ cd ~/.dotfiles/stow_home
$ stow -D [application name e.g. vim]
```