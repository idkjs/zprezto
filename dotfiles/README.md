# Dotfiles

Ripped off from <https://github.com/peterpme/dotfiles>. Basically took out the stuff I dont use or dont understand.

## .ZSHRC

**Note that this script generates the `~./.zshrc` file in your root directory. That is the file you have to open and some of the code mentioned below. `.zshrc` is not in this repo.**

## NPM

After running the [first_time_setup.sh](./first_time_setup.sh) script running npm doesnt work until you add [`eval "$(fnm env --multi)"`](https://github.com/Schniz/fnm#manually) to your `~/.zshrc` file. Then reload/restart your terminal or run `source ~/.zshrc`. You can then run `npm -v` and get some output. I guess this should be setup in the script somewhere -> TODO. Done. Adding the fnm env script produced the following in `.zshrc`:

```sh
export PATH=/var/folders/rt/7lc5vcw16459dszl8djk35fh0000gn/T/fnm-shell-9103786/bin:$PATH
export FNM_MULTISHELL_PATH=/var/folders/rt/7lc5vcw16459dszl8djk35fh0000gn/T/fnm-shell-9103786
export FNM_DIR=/Users/mandalarian/.fnm
export FNM_NODE_DIST_MIRROR=https://nodejs.org/dist
export FNM_LOGLEVEL=info
```

So i copied it and added it to exports. Seems like not the intended way but it works.

## Prezto

Switched Prezto to default from <https://github.com/sorin-ionescu/prezto>. Seems to work more smoothly now.

## Alias and Exports and Paths

To get these to work you have source them from `.zshrc` like so

```sh
# ~/.zshrc
source ./alias
source ./exports
```

If you want to add paths and extra aliases, you can add them into alias and path. this is loaded by ~/.zshenv

## Other Resources to Consider

[Chezmoi](https://www.chezmoi.io) git dotfiles manager looks really interesting.
[DotBot](https://github.com/anishathalye/dotbot)

### VsCode only scripts

`source editors/vscode/install`

### Integrate DotBot with Existing Dotfiles

The following will help you get set up using Dotbot in just a few steps.

If you're using **Git**, you can add Dotbot as a submodule:

```bash
cd ~/.dotfiles # replace with the path to your dotfiles
git init # initialize repository if needed
git submodule add https://github.com/anishathalye/dotbot
git config -f .gitmodules submodule.dotbot.ignore dirty # ignore dirty commits in the submodule
cp dotbot/tools/git-submodule/install .
touch install.conf.yaml
```
### Basher ClI
<!-- https://www.vogella.com/tutorials/GitSubmodules/article.html -->
1. `git submodule add https://github.com/basherpm/basher.git`.
2. `export PATH="$HOME/.basher/bin:$PATH"`
3. `eval "$(basher init - zsh)"`
<!-- to update basher submodule -->
4. `git submodule update --init ./basher` 

## Quicklook?

https://github.com/Huxpro/dotfiles/blob/f5d25c26a294a4f5183b01cbc07002b5ec70d001/README.md

## Alacrity/Fzf

Had it in some other dotfiles. Gave better command history search. find it again.

## Xcode software update

`softwareupdate --list`

## Using Plugins with Pretzo

https://github.com/belak/prezto-contrib#prezto-contrib

```sh

cd $ZPREZTODIR
git clone --recurse-submodules https://github.com/belak/prezto-contrib contrib
```

Example using [pure-prompt](https://github.com/sindresorhus/pure#getting-started)

Bad example because Pure is bundled with Prezto. No need to install it.

Just Add `prompt pure` to your `~/.zpreztorc` after running `cd $ZPREZTODIR` then `code ~/.zpreztorc`.

Then find this and add `prompt pure`:
```sh
# Set the Prezto modules to load (browse modules).
# The order matters.
zstyle ':prezto:load' pmodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'directory' \
  'spectrum' \
  'utility' \
  'completion' \
  'pure'
```

## Setting git credententials so terminal stops asking

```sh
#!/bin/sh
# https://stackoverflow.com/questions/5343068/is-there-a-way-to-cache-github-credentials-for-pushing-commits
while read line
do
  echo "$line"
done < "/dev/stdin"
echo username=idkjs
echo password=<this_is_not_your_web_password>
```

## Accessing `./zshrc`

With `pretzo` you can acces it with `code ${ZDOTDIR:-$HOME}/.zshrc` same as `~/.zshrc` or `code ${HOME}/.zshrc`.
So looks like the root `.zshrc` is at `~/.zprezto/runcoms/zshrc`

## CRUCIAL

When setting path variables, dont use double quotes.
```sh
❯ export PATH=$HOME/.basher/bin:$PATH >> ~/.zshrc
```
and not

```sh
❯ export PATH="$HOME/.basher/bin:$PATH" >> ~/.zshrc
```

## ${ZDOTDIR:-$HOME}

```sh
❯ echo ${ZDOTDIR:-$HOME}
/Users/mandalarian
```

## ZPretzo Docs

[Users/mandalarian/.zprezto/runcoms/README.md](${HOME}/.zprezto/runcoms/README.md)