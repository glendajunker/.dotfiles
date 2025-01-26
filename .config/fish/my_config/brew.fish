set -x HOMEBREW_NO_AUTO_UPDATE 1

abbr --add brewSync "brew update && brew upgrade && brew upgrade --cask (brew list --cask) && brew cleanup && brew bundle dump --force"