pkgs=$1

if command -v apt >/dev/null 2>&1; then
    PKG_MANAGER="apt"
    PKG_UPDATE="update"
    PKG_UPGRADE="upgrade"
    PKG_NOCONFIRM="-y"
    PKG_INSTALL="install"
elif command -v dnf >/dev/null 2>&1; then
    PKG_MANAGER="dnf"
    PKG_UPDATE="check-update"
    PKG_UPGRADE="upgrade"
    PKG_NOCONFIRM="-y"
    PKG_INSTALL="install"
elif command -v yum >/dev/null 2>&1; then
    PKG_MANAGER="yum"
    PKG_UPDATE="check-update"
    PKG_UPGRADE="update"
    PKG_NOCONFIRM="-y"
    PKG_INSTALL="install"
elif command -v pacman >/dev/null 2>&1; then
    PKG_MANAGER="pacman"
    PKG_UPDATE="-Syy"
    PKG_UPGRADE="-Syu"
    PKG_NOCONFIRM="--noconfirm"
    PKG_INSTALL="-S"
elif command -v zypper >/dev/null 2>&1; then
    PKG_MANAGER="zypper"
    PKG_UPDATE="refresh"
    PKG_UPGRADE="update"
    PKG_NOCONFIRM="-y"
    PKG_INSTALL="install"
elif command -v emerge >/dev/null 2>&1; then
    PKG_MANAGER="emerge"
    PKG_UPDATE="--sync"
    PKG_UPGRADE="-uDU @world"
    PKG_NOCONFIRM=""  # no global no-confirm option for emerge
    PKG_INSTALL="" # no separate install cmd for emerge
elif command -v apk >/dev/null 2>&1; then
    PKG_MANAGER="apk"
    PKG_UPDATE="update"
    PKG_UPGRADE="upgrade"
    PKG_NOCONFIRM="--no-confirm"
    PKG_INSTALL="add"
else
    echo "ERROR: unknown package manager"
    exit 1
fi

# update system
sudo "${PKG_MANAGER}" "${PKG_UPDATE}" || abort "could not update system"
# upgrade
sudo "${PKG_MANAGER}" "${PKG_UPGRADE}" "${PKG_NOCONFIRM}" || abort "could not upgrade pkgs"
# finally install gcc
sudo "${PKG_MANAGER}" "${PKG_INSTALL}" "${PKG_NOCONFIRM}" gcc make cmake || abort "could not install basic"

if [ -n "${pkgs}" ]; then
    sudo "${PKG_MANAGER}" "${PKG_INSTALL}" "${PKG_NOCONFIRM}" "${pkgs}" || abort "could not install pkgs"
fi
