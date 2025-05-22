# dotfiles

## Nerdfont

Download some nerd font from [nerdfonts.com](https://www.nerdfonts.com/) and install it on your OS

you can look through installed fonts with

fc-list | grep -i YourFont

## Starship

[Install Starship](https://github.com/starship/starship?tab=readme-ov-file#step-1-install-starship)

then create symlink with:

ln -s ~/projects/dotfiles/starship/starship.toml ~/.config/

(there might already be a config file, in which case delete it)

rm ~/.config/starship.toml

configure your shell to use starship (extend your .bashrc), here's the command for bash:

eval "$(starship init bash)"

## Wezterm

[Install wezterm](https://wezterm.org/install/linux.html#installing-on-fedora-and-rpm-based-systems-via-copr)

then create symlink for the config:

ln -s ~/projects/dotfiles/wezterm ~/.config/

## Neovim

[Install Nvim](https://github.com/neovim/neovim/blob/master/INSTALL.md)

then create symlink for the config:

ln -s ~/projects/dotfiles/nvim ~/.config/
