# Server Dotfiles

[![Managed with GNU Stow](https://img.shields.io/badge/Managed%20with-GNU%20Stow-red.svg)](https://www.gnu.org/software/stow/)

Basic `.vimrc` and `.bash_aliases` for (Linux) servers

## Usage

Make sure to install `stow`!

If you're new to using `stow`, check out [this article](https://alexpearce.me/2016/02/managing-dotfiles-with-stow/).

```bash
$ git clone https://github.com/graves501/server-dotfiles ~/.dotfiles 
$ cd ~/.dotfiles/stow_home
$ stow -t ~ [application name e.g. vim]
```
