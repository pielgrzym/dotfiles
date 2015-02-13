function pnc() {
    if (( $# == 0 ))
    then echo 'usage: pnc directory_or_file first@key.com second@key.com > output.tgz.gpg'; return 1; fi
    src_name=$1
    shift
    recipients=""
    for email in ${(Oa)*}; do
        recipients="$recipients -r $email"
    done
    gpg_cmd="gpg$recipients -o- -e"
    tar czf - $src_name | eval $gpg_cmd
}
