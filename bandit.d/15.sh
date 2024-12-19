nc -N localhost 30000 < /etc/bandit_pass/bandit14 | grep -xEo '[[:alnum:]]+'
