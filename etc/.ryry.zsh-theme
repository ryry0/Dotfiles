# Modify the colors and symbols in these variables as desired.
GIT_PROMPT_SYMBOL="%{$fg[blue]%}"
GIT_PROMPT_PREFIX="%{$fg[green]%}[%{$reset_color%}"
GIT_PROMPT_SUFFIX="%{$fg[green]%}]%{$reset_color%}"
GIT_PROMPT_AHEAD="%{$fg[red]%}ANUM%{$reset_color%}"
GIT_PROMPT_BEHIND="%{$fg[cyan]%}BNUM%{$reset_color%}"
GIT_PROMPT_MERGING="%{$fg_bold[magenta]%}!%{$reset_color%}"
GIT_PROMPT_UNTRACKED="%{$fg_bold[red]%}*%{$reset_color%}"
GIT_PROMPT_MODIFIED="%{$fg_bold[yellow]%}*%{$reset_color%}"
GIT_PROMPT_STAGED="%{$fg_bold[green]%}*%{$reset_color%}"

# Show Git branch/tag, or name-rev if on detached head
parse_git_branch() {
  (git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD) 2> /dev/null
}

# Show different symbols as appropriate for various Git repository states
parse_git_state() {

  # Compose this value via multiple conditional appends.
  local GIT_STATE=""

  local NUM_AHEAD="$(git log --oneline '@{u}..' 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
  fi

  local NUM_BEHIND="$(git log --oneline '..@{u}' 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
  fi

  if ! git diff --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
  fi

  if [[ -n $GIT_STATE ]]; then
    echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
  fi

}

# If inside a Git repository, print its branch and state
git_prompt_string() {
  local git_where="$(parse_git_branch)"
  [ -n "$git_where" ] && echo "$GIT_PROMPT_SYMBOL$(parse_git_state)$GIT_PROMPT_PREFIX%{$fg[yellow]%}${git_where#(refs/heads/|tags/)}$GIT_PROMPT_SUFFIX "
}

#########################

function batt_remain() { echo "$(acpi | cut -f2 -d ',' | grep -oE "[[:digit:]]{1,}" )"}

function battery_prompt() {
	b=$(batt_remain)
	if [ $b -gt 50 ] ; then
		color='green'
	elif [ $b -gt 20 ] ; then 
		color='yellow'
	else
		color='red'
	fi
	echo "[%{$fg[$color]%}$(batt_remain)%%%{$reset_color%}]"
}

function check_tmux() 
{
	if [ $TERM = "linux" ] ; then
		echo "[%{$fg[cyan]%}$(wpa_cli -i wlp2s0 status | sed -n 's/^ssid=//p')%{$reset_color%}]$(battery_prompt)[%{$fg[blue]%}%W%{$reset_color%}][%{$fg[blue]%}%t%{$reset_color%}][%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[red]%}%M%{$reset_color%}]"
	else #only display host name when over ssh
		if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
			echo "[%{$fg[cyan]%}%n%{$reset_color%}@%{$fg[red]%}%M%{$reset_color%}]"
		fi
	fi
}

vim_ins_mode="%{$fg[white]%}%{$reset_color%}"
vim_cmd_mode="[%{$fg[green]%}CMD%{$reset_color%}]"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

PROMPT="\$(git_prompt_string)%{$fg[cyan]%}%1~ %{$fg[blue]%}%#%{$reset_color%}>"

RPROMPT="\${vim_mode}%(1j.[%{$fg[yellow]%}%j%{$reset_color%}].)%(?..[%{$fg[red]%}%?%{$reset_color%}])$(check_tmux)"
