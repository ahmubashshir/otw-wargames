grep -REo '/.+/.+_bandit22\.sh' /etc/cron.d 2> /dev/null |
	sort -u |
	cut -d: -f2 |
	xargs grep -Eo '> .+' |
	cut -c3- |
	xargs cat
