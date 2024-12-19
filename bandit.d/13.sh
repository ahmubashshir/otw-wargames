exec bash -x
decode() {
	read -r d < <(tr -d '[:space:]')
	base64 -d <<< $d | \
	case "$(base64 -d <<< "$d" | file  -b --mime-type -)" in
		application/gzip) gzip -dq 2>/dev/null| base64 | decode ;;
		application/x-bzip2) bunzip2 | base64 | decode;;
		application/x-tar)	tar -xOf - | base64 | decode;;
		text/plain) cat;;
		*) file -;;
	esac
}

grep -Eo '\s[0-9a-f]{4}' data.txt \
| grep -Eo '[0-9a-f]{2}' \
| xargs printf '\\x%s' \
| xargs -0 printf \
| base64 \
| decode \
| grep -Eo '[[:alnum:]]+$'
