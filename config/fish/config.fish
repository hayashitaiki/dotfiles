# ----------------------------
#  Env
# ----------------------------
# workspace
set -x WORKSPACE $HOME/develop

# XDG Base Directory
set -x XDG_CONFIG_HOME $HOME/.config

# less
set -x LESS -SRXF

# default editor
set -x VISUAL "nvim"
set -x EDITOR "nvim"

# keybase
# refs: https://github.com/keybase/keybase-issues/issues/2798
set -x GPG_TTY (tty)

# zoxide
if type "zoxide" > /dev/null 2>&1
  set -x _ZO_DATA_DIR $XDG_CONFIG_HOME/zoxide
  set -x _ZO_EXCLUDE_DIRS $HOME:$WORKSPACE/tool/google-cloud-sdk
  zoxide init fish --no-aliases | source
end

# go
if type "go" > /dev/null 2>&1
  set -x GOPATH $WORKSPACE
  set -x PATH $WORKSPACE/bin $PATH
  set -x GO111MODULE on
end

# Rust
if test -d "$HOME/.cargo/bin"
  set -x PATH $HOME/.cargo/bin $PATH
end

# java (sdkman)
if test -d "$HOME/.sdkman/bin"
  function sdk
    bash -c "source $HOME/.sdkman/bin/sdkman-init.sh && sdk $argv"
  end
  for ITEM in $HOME/.sdkman/candidates/* ;
    set -gx PATH $PATH $ITEM/current/bin
  end

  set -x JAVA_HOME "$HOME/.sdkman/candidates/java/current"
end

# nodebrew
if test -d "$HOME/.nodebrew/current/bin"
  set -x PATH $HOME/.nodebrew/current/bin $PATH
end

# deno
if type "deno" > /dev/null 2>&1
  set -x PATH $HOME/.deno/bin $PATH
end

# docker
if type "docker" > /dev/null 2>&1
  set -x DOCKER_BUILDKIT 1
end

# brew
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

# Google Cloud SDK
if test -f "$WORKSPACE/tool/google-cloud-sdk/path.fish.inc"
  # The next line updates PATH for the Google Cloud SDK.
  . "$WORKSPACE/tool/google-cloud-sdk/path.fish.inc"
end

# ログインメッセージを表示しない
set fish_greeting
# コマンドの青が見にくいので明るくする
# set fish_color_command "#9BB8DC"


# ----------------------------
#  Aliases
# ----------------------------
abbr -a vi 'nvim'
abbr -a o  'open'
abbr -a b  'open -a "/Applications/Google Chrome.app"'
abbr -a t  'tmux attach; or tmux'
abbr -a x  'exit'
abbr -a c  'clear'
abbr -a rm 'rm -rf'

# Git
abbr -a g    'git'
abbr -a gb   'git branch -a'
abbr -a gbv  'git branch -a -vv'
abbr -a gbd  'git branch -d'
abbr -a gbD  'git branch -D'
abbr -a gp   'git pull --rebase --prune --tags'
abbr -a gf   'git fetch --prune --tags'
abbr -a gm   'git merge -v'
abbr -a gcm  'git commit -v'
abbr -a gcma 'git commit -v --amend --date (env LANG=en_US.UTF-8 date -R)'
abbr -a grs  'git restore'
abbr -a grss 'git restore --staged'
abbr -a grb  'git rebase'
abbr -a grv  'git revert'
abbr -a gs   'git status -sb'
abbr -a gst  'git stash'
abbr -a gstl 'git stash list'
abbr -a gstp 'git stash pop --index'
# abbr -a gco  'git checkout'
# abbr -a gcob 'git checkout -b'
abbr -a gsw  'git switch'
abbr -a gswc 'git switch -c'
abbr -a gcp  'git cherry-pick --ff'
abbr -a gad  'git add -v'
abbr -a gada 'git add -v -A'
abbr -a gpo  'git push -u origin'
abbr -a gpfo 'git push --force-with-lease -u origin'
abbr -a gd   'git diff'
abbr -a gdc  'git diff --cached'
abbr -a gll  'git log --no-merges --date=short --pretty="format:%C(yellow)%h %C(reset)%ad %C(blue)%an:%C(auto)%d %C(reset)%s"'
abbr -a glp  'git log -p -1 --stat --decorate'
abbr -a glg  'git log --graph --date=short --format="%C(yellow)%h %C(reset)%ad %C(blue)%an %C(auto)%d%n %w(80)%s%n"'

# GitHub
abbr -a repo 'gh repo view --web'
abbr -a pr   'gh pr view --web || gh pr create'
abbr -a prc  'gh pr checkout'

# Docker
abbr -a d  'docker'
abbr -a dr 'docker run --rm -it -v $PWD:/workspace'
abbr -a dc 'docker compose'

# K8s
abbr -a kb 'kubectl'


# ----------------------------
#  Key Binds
# ----------------------------
bind \cr '__fzf_history'
bind \cb '__fzf_git_branch -a'
bind \cl '__fzf_git_log'
bind \cs '__fzf_git_status'
bind \cd '__fzf_directory -z'
bind \co '__fzf_docker_images -i'
bind \cf '__fzf_file -f'
bind \cp '__fzf_pr'
