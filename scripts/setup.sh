#!/usr/bin/env bash

config_dir="${HOME}/.config"
OS="$(uname)"
base_pkgs="fd rg zoxide bat eza fastfetch nodejs go fish lazygit starship"

function abort() {
  echo "ERROR: $1" >&2
  exit 1
}

if [ -n "${XDG_CONFIG_HOME}" ]; then
    echo "xdg config home set using it"
    config_dir="${XDG_CONFIG_HOME}"
fi

echo "setup git email username? y/n"
read git

if [[ "${git}" == "y" ]]; then
    echo "username:"
    read username
    git config --global user.name "${username}"

    echo "email:"
    read email
    git config --global user.email "${email}"

    echo "set wsl cred manager? y/n"
    read gitcred

    if [[ "${gitcred}" == "y" ]]; then
        git config --global credential.helper "/mnt/c/Program\ Files/Git/mingw64/bin/git-credential-manager.exe"
    fi
fi

echo "install pkgs? y/n"
read pkgs

if [[ "${pkgs}" == "y" ]]; then
    echo "do you want to use brew? y/n"
    read brew

    if [[ "${brew}" == "y" ]]; then
        echo "using brew"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" || abort "could not install homebrew"

        if [[ "${OS}" == "Linux" ]]
        then
            brew_path="/home/linuxbrew/.linuxbrew"
        elif [[ "${OS}" == "Darwin" ]]
        then
            # only on arm macs
            brew_path="/opt/homebrew"
        else
          abort "Homebrew is only supported on macOS and Linux."
        fi

        export PATH="${brew_path}/bin:${PATH}"

        # brew install "${base_pkgs}" || abort "could not install pkgs"
        for pkg in ${base_pkgs}; do
            brew install "${pkg}" || 
            # retry once
            brew install "${pkg}" || 
            abort "failed to install ${pkg}"
        done
    else
        source ./package-manager.sh "${base_pkgs}" || abort "package manager script failed"
    fi
    source ./package-manager.sh || abort "package manager script failed"
fi

echo "do you want rust? y/n"
read rust

if [[ "${rust}" == "y" ]]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh || abort "could not install rust"
fi

echo "install neovim master? y/n"
read neovim

if [[ "${neovim}" == "y" ]]; then
    source ./neovim-master.sh || abort "nvim install failed"
fi

echo "set default shell to fish? y/n"
read fish

if [[ "${fish}" == "y" ]]; then
    # TODO: this might not work in every system 
    if [[ "${brew_path}" ]]; then 
        chsh -s "${brew_path}/bin/fish" ||
        echo "${brew_path}/bin/fish" | sudo tee -a /etc/shells && chsh -s "${brew_path}/bin/fish"||
        abort "error setting fish shell (brew)"
    else
        chsh -s "/bin/fish" ||
        echo "/bin/fish" | sudo tee -a /etc/shells && chsh -s "/bin/fish" ||
        abort "error setting fish shell (bin)"
    fi
fi

# clone my own repos

if [ ! -d "${config_dir}/nvim" ]; then
    git clone https://github.com/kmate19/nvim "${config_dir}/nvim" || abort "failed to clone repo nvim"
fi

if [ -d "${HOME}/dotfiles" ]; then
    mv "${HOME}/dotfiles" "${config_dir}"
fi

# symlinks

if [ ! -d "${config_dir}/fish" ]; then
    mkdir "${config_dir}/fish" || abort "failed to mkdir ${config_dir}/fish"
fi

if [ ! -d "${config_dir}/ghostty" ]; then
    mkdir "${config_dir}/ghostty" || abort "failed to mkdir ${config_dir}/ghostty"
fi

if [ -f "${config_dir}/fish/config.fish" ]; then
    rm "${config_dir}/fish/config.fish" || abort "failed to rm ${config_dir}/fish/config.fish"
fi

if [ -f "${config_dir}/ghostty/ghostty_conf" ]; then
    rm "${config_dir}/ghostty/ghostty_conf" || abort "failed to rm ${config_dir}/ghostty/ghostty_conf"
fi

if [ ! -L "${config_dir}/fish/config.fish" ]; then
    ln -s "${config_dir}/dotfiles/config.fish" "${config_dir}/fish/config.fish" || abort "failed to link fish"
fi

if [ ! -L "${config_dir}/ghostty/ghostty_conf" ]; then
    ln -s "${config_dir}/dotfiles/ghostty_conf" "${config_dir}/ghostty/ghostty_conf" || abort "failed to link ghostty"
fi
