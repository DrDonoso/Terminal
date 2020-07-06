# Installation

## Install zsh

First of all we need to install zsh, it will require to run the next command with your admin credentials.

```sh
sudo apt-get install zsh
```

Execute zsh intaller

```sh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
```

And then, set zsh to default

```sh
chsh -s `which zsh`
```

Restart to see changes applied

## Apply zsh theme

First of all we need to update packages so run:

```sh
sudo apt-get update
```


## Install fzf

Then, we are going to install fzf (an interactive filter for command-line <https://github.com/junegunn/fzf>)

```sh
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

## Install zimfw

```sh
curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
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