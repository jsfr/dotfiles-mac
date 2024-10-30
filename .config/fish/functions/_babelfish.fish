function _babelfish -a file
    if not command -q go
        echo "Please install go runtime to use _babelfish"
        exit 1
    end

    switch (uname)
    case Linux
        set -f file_hash (md5sum "$file" | cut -f 1 -d " ")
        set -f cache_file "$HOME/.cache/babelfish_$file_hash"

        if test -e "$cache_file"
            set -f file_time (stat -c '%Y' $file)
            set -f cache_time (stat -c '%Y' $cache_file)
        end
    case Darwin
        set -f file_hash (md5 -q "$file")
        set -f cache_file "$HOME/.cache/babelfish_$file_hash"

        if test -e "$cache_file"
            set -f file_time (stat -f '%m' $file)
            set -f cache_time (stat -f '%m' $cache_file)
        end

    end

    if test -z "$cache_time" -o "$file_time" -gt "$cache_time"
        cat "$file" | go run bou.ke/babelfish@latest > "$cache_file"
    end

    cat "$cache_file"
end
