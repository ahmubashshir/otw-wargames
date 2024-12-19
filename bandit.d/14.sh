ssh -qT \
	-o IdentityFile=sshkey.private \
	-o StrictHostKeyChecking=accept-new \
	-o UserKnownHostsFile=/dev/null \
	-p 2220 bandit14@localhost \
	cat /etc/bandit_pass/bandit14
