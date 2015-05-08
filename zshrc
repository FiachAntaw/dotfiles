# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
setopt histignorealldups sharehistory
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Remove RPROMPT indent
ZLE_RPROMPT_INDENT=0

# Use modern completion system
autoload -Uz compinit
compinit

# Import base16 colors
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Install antigen
source ~/.antigen/antigen/antigen.zsh

# Load oh-my-zsh's library
antigen use oh-my-zsh

# Load bundles
antigen bundles <<EOBUNDLES
	git
	pip
	python
	virtualenv
	virtualenvwrapper
	zsh-users/zsh-syntax-highlighting
	zsh-users/zsh-history-substring-search
EOBUNDLES

# Apply antigen bundles
antigen apply

# Set prompt
PROMPT="%{$fg_no_bold[green]%}%n %{$fg_bold[blue]%}%~ %{$reset_color%}\$ "
RPROMPT="%{$reset_color%}[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

# Auto-select first entry when doing tab completion
setopt menucomplete

# Import aliases
source ~/.bash_aliases

# Set default editor to vim
export VISUAL=vim
export EDITOR="$VISUAL"
