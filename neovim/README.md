## neovim config
Fast setup your neovim for python & Elixir Developer


Clone this Repo
```
$ git clone https://github.com/Dogzhou/vim_config.git & cd vim_config
```

Get [vim-plug](https://github.com/junegunn/vim-plug) installed

Move `init.vim` into your system folder

```
$ mkdir ~/.config/nvim
$ cp init.vim ~/.config/nvim
```

Open neovim, install plugins(type `:PlugInstall`, then press return)

## Solarized8
`solarized8` is a color scheme. copy the whole `colors` folder into in `~/.config/nvim/`
```
$ cp -f colors/ ~/.config/nvim
```

## troubleshoot
1.neovim doesn't recognize `^M` in the configuration file

Answer: check you git config, make sure `core.autocrlf=input`, delete `~/.vim/plugged` folder and re-run `:PlugInstall`
