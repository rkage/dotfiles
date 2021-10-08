function ls --wraps=lsd --description 'lsd shorthand, replacement for ls'
  if type -q lsd
    lsd $argv
  end
end

