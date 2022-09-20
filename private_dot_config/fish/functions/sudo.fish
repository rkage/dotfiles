function sudo --wraps=doas --description="smooth transition sudo to doas"
    if command -qs doas
        doas $argv
    end
end
