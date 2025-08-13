#!/bin/sh

set -e

if [ $# -ne 2 ]; then 
    echo "Usage: $0 OLD NEW" >&2
    return 1
fi

OLD="$1"
NEW="$2"

if ! [ -d "$OLD" ]; then
    echo "$OLD: Not a directory" >&2
    return 1
fi

if [ -d "$NEW" ]; then 
    echo "$NEW: Already exists" >&2
    return 1
fi

printf "\n\033[1;31mWarning:\033[0;1m "
printf "Be careful, it is safer to rename manually.\033[0m\n\033[2A"

printf "Rename '$OLD' to '$NEW'? [y/N] "
read ans || ans="n"

printf "\r\033[0J"
case "$ans" in
    [Yy]*) ;; # continue
    *)     return 1;;
esac

FILES="
manage.py
$OLD/asgi.py
$OLD/wsgi.py
$OLD/settings.py
"

for file in $FILES; do
    if [ -f "$file" ]; then
        sed "s/$OLD\./$NEW\./g" "$file" > "$file.tmp" && \
        mv "$file.tmp" "$file"
    fi
done

mv $OLD $NEW

echo "Successfully renamed."