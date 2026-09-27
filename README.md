# Dotfiles

These dotfiles use [GNU Stow](https://www.gnu.org/software/stow/) to manage
configuration packages in the home directory.

## First-time setup

Clone the repository and initialize the Claude configuration submodule:

```bash
git clone https://github.com/ptiede/dotfiles.git ~/dotfiles
cd ~/dotfiles
git submodule update --init --recursive
```

Before stowing a package, move any existing configuration out of the way so
Stow does not overwrite it. For example:

```bash
mv ~/.bashrc ~/.bashrc.backup
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.claude ~/.claude.backup
```

Then activate the packages:

```bash
stow --target="$HOME" bash claude nvim
```

The packages are:

- `bash` — `~/.bashrc`, including Omarchy’s shell environment and defaults.
- `nvim` — `~/.config/nvim`, including Omarchy theme integration and Iron REPL.
- `claude` — `~/.claude`, from the `ptiede/claude_config` submodule.

The Claude submodule points to Paul Tiede’s fork. Tim Holy’s repository is
configured only as its `upstream` remote for fetching updates; never push to it.

## Updating

Update the parent repository and submodule pointer:

```bash
git pull --ff-only
git submodule update --init --recursive
stow --restow --target="$HOME" bash claude nvim
```

To update the Claude fork from its upstream repository, fetch and merge within
the submodule, then push the submodule and update the parent pointer:

```bash
git -C claude/.claude fetch upstream
git -C claude/.claude merge upstream/main
git -C claude/.claude push origin main
git add claude/.claude
git commit -m "Update Claude config submodule"
git push
```

## Removing the Stow links

```bash
stow --delete --target="$HOME" bash claude nvim
```

This removes the symlinks; it does not remove the packages or the backups you
made before activation.
