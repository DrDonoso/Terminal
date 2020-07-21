# Installation

## Install zsh

First of all we need to install zsh, it will require to run the next command with your admin credentials.

```sh
sudo apt-get install zsh
```

Execute zsh intaller

And then, set zsh to default

```sh
chsh -s `which zsh`
```

Restart to see changes applied

## Install zimfw

```sh
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
```

## Install fzf

Then, we are going to install fzf (an interactive filter for command-line <https://github.com/junegunn/fzf>)

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Copy configuration files

Run the following script to copy alias and theme.

```sh
./install.sh
```

### Performance tips
To improve performance disable these modules from .zimrc
- zmodule steeef
- zmodule completion -->

## Other tools needed for some alias

### Azure Devops CLI

```sh
az extension add --name azure-devops
```