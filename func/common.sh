dull() {
    if [ ! -z $1 ]; then
        du -h -x -- $1 | sort -r -h | head -20;
    else
        echo "The path is missing"
    fi
}


