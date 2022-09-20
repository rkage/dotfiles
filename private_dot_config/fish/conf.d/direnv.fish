# determine if direnv is installed and install it's hooks
# vim:filetype=fish:shiftwidth=4

if command -sq direnv
    direnv hook fish | source
end
