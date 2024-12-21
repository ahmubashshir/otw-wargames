socat STDIO OPENSSL:localhost:30001,verify=0 < /etc/bandit_pass/bandit15 |
	grep -xEo '[[:alnum:]]+'
