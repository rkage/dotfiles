# vim:filetype=fish:shiftwidth=4

if command -qv gh
    abbr -a grv gh repo view -w
    abbr -a gpv gh pr view -w
end
