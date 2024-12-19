find / -user bandit7 -group bandit6 -size 33c -exec grep -Eo '[^[:blank:]]+' '{}' + 2> /dev/null
