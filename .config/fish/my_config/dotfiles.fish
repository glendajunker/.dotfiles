alias config '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

abbr --add cc 'config'
abbr --add cca 'config add'
abbr --add ccc 'config commit --verbose'
abbr --add ccd 'config diff'
abbr --add ccds 'config diff --staged'
abbr --add ccdw 'config diff --word-diff'
abbr --add ccg 'config log --graph --pretty=format:"%C(yellow)%h%C(auto)%d %s %Cgreen%cr"'
abbr --add ccp 'config push'
abbr --add ccrh 'config reset'
abbr --add ccrs 'config restore'
abbr --add ccs 'config show'
abbr --add ccsn 'config show --name-status'
abbr --add ccst 'config status'
abbr --add ccu 'config fetch && config pull'

function _get_commit_id
  set commit_id (config log --date=format-local:'%Y%m%d%H%M' --pretty=format:'%h %<(20) %ad %<(20) %s' | fzf --no-multi | awk '{print $1}')
  echo $commit_id
end

function ccgs -d "search .dotfiles git log & show selected commit"
  set commit_id (_get_commit_id)
  if [ -z "$commit_id" ]
    return
  end
    config show $commit_id
end

function ccri -d "search .dotfiles git log & rebase interactive with selected commit"
  set commit_id (_get_commit_id)
  if [ -z "$commit_id" ]
    return
  end
    config rebase -i $commit_id
end
