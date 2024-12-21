grep -REo '/.+/.+_bandit23\.sh' /etc/cron.d 2> /dev/null |
	sort -u |
	cut -d: -f2 |
	xargs sed 's/whoami/echo bandit23/' |
	sh 2> /dev/null |
	sed -E 's@^.+ to (/tmp/.+)$@\1@' |
	xargs cat
