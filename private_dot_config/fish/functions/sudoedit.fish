function sudoedit --wraps=doas --description="smooth transition sudo to doas"
    if command -qs doas
        doas $EDITOR $argv
    end
end
