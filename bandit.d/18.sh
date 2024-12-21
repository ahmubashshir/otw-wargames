diff  -u passwords.old passwords.new |
	grep -Eo '^\+[^+].+$' |
	cut -c2-
