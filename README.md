## vim_config
Fast own your own perfect VIM editor for Ruby & Elixir Developer

Prior to overwrite your `.vimrc`, Please install [vundle](https://github.com/VundleVim/Vundle.vim) ahead.

Clone this Repo
```
$ git clone https://github.com/Dogzhou/vim_config.git & cd vim_config
```

Overwrite system `.vimrc` file
```
$ cp .vimrc ~/
```
Open Vim, install plugins(type `:PluginInstall`, then press return)

## Solarized.vim
`solarized.vim` is a color scheme for Vim. put into in `~/.vim/colors`. if the directory does not exist, please create it mannualy

```
$ mkdir ~/.vim/colors
$ cp solarized.vim ~/.vim/colors
```

## Solarized_Dark.xcs
Solarized Dark.xcs is one color schemes for xshell which is a ssh software in windows. start xshell then click color schemes and import it

## Deja Vu Sans Mono.ttf
Deja Vu Sans Mono.ttf is a windows font, just double click when you are on windows

## Change Iterms Color Presets to **Solarized Dark**
**Preferences -> Profiles -> Colors -> Color Presets -> Solarized Dark/Light**

## vim-devicons
```
$ brew tap homebrew/cask-fonts
$ brew cask install font-hack-nerd-font
```

Open Iterm2, Preferences => Profiles => Text => Non-ASCII Font => Hack Nerd Font
