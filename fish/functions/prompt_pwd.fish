function prompt_pwd
	set -l home ~
	echo $PWD | awk -v home="$home" '
	{
	sub(home, "~")
	n = split($0, s, "/")

	for (i = 1; i < n - 1 ; i++) {
		printf("%s/", substr(s[i], 1, 1))
		}

		if (s[n] == "~" && s[n-1] == "") {
			printf("~\n")
			} else {
			printf("%s/%s\n", s[n-1], s[n])
			}
			}
			'
end
