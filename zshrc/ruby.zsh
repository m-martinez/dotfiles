# Ruby
if command -v ruby &> /dev/null && command -v gem &> /dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
