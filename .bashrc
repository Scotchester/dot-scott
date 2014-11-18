# Source all dem settings
for file in ~/.{exports,bash_prompt,aliases,local_settings}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Increase the number of allowed open file descriptors so grunt
# doesn't throw an error when watching a large number of files
ulimit -n 2048

# Enable bash <tab> completion for grunt
eval "$(grunt --completion=bash)"
