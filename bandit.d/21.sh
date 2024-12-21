printf '%s\0' \
	"sleep 1;./suconnect 12345 > /dev/null" \
	"nc -l 12345 < /etc/bandit_pass/$USER" |
	xargs -P2 -0n1 sh -c
