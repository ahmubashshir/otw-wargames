seq 31000 32000 |
	xargs -n1 netcat -zvw10 localhost 2>&1 |
	sed -nE '/succeeded!$/s@^.+ ([0-9]+) port .+$@\1@p' |
	while read -r port; do
		echo | socat STDIO OPENSSL:localhost:$port,verify=0 > /dev/null 2>&1 &&
			echo $port
	done |
	while read -r port; do
		read -r pass < "/etc/bandit_pass/$USER"
		p=$(echo "$pass" | socat STDIO OPENSSL:localhost:$port,verify=0)
		[ "$p" = "$pass" ] || printf '%s\n' "$p"
	done |
	sed -nE '/^-----/,/^-----/p' |
	base64 -w0 |
	sed 's/^/@key:/'
