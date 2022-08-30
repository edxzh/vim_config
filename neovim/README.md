## neovim config
Fast setup your neovim for python & Elixir Developer


Clone this Repo
```
$ git clone https://github.com/Dogzhou/vim_config.git & cd vim_config
```

Get [vim-plug](https://github.com/junegunn/vim-plug) installed

Move `init.vim` into your system folder

```
mkdir ~/.config/nvim
cp init.vim ~/.config/nvim
git clone https://github.com/lifepillar/vim-solarized8.git
mkdir ~/.config/nvim/colors
cp vim-solarized8/colors/*.vim ~/.config/nvim/colors
cp colors/*.vim 
```

# Plugins

## coc-elixir
run `:CocInstall coc-elixir` in vim, then

Make sure you've got elixir, mix and yarn available in $PATH

```
asdf install erlang latest
asdf global erlang latest
asdf install elixir latest
asdf global elixir latest
asdf install yarn latest
asdf global yarn latest
Download latest elixir-ls release and unzip
curl -fLO https://github.com/elixir-lsp/elixir-ls/releases/latest/download/elixir-ls.zip
unzip elixir-ls.zip -d ~/.vim/plugged/coc-elixir/els-release
```

## Ctags

```
brew install ctags
cp .ctags ~/.ctags
```

## semshi(python highlight)

```
pip3 install pynvim --upgrade
vi
:UpdateRemotePlugins
```

Open neovim, install plugins(type `:PlugInstall`, then press return)

## Solarized8
`solarized8` is a color scheme. copy the whole `colors` folder into in `~/.config/nvim/`
```
cp -f colors/ ~/.config/nvim
```

## troubleshoot
1.neovim doesn't recognize `^M` in the configuration file

Answer: check you git config, make sure `core.autocrlf=input`, delete `~/.vim/plugged` folder and re-run `:PlugInstall`

2. Error message "error:0308010C:digital envelope routines::unsupported"

https://stackoverflow.com/questions/69692842/error-message-error0308010cdigital-envelope-routinesunsupported
