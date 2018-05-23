for name in $(gawk '{print $1}' $1 | sort); do
	pass="$(grep $name init_user)";
	emaila="$(grep $name email | gawk '{print $2}')"
	sed -e 's|\$name|'"$pass"'|g' -e 's|\$email|'"$emaila"'|g' draft_email > /tmp/send
	sendmail -t < /tmp/send
done
