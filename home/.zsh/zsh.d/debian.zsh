if $(command -v apt-get 2>&1 > /dev/null); then
    alias upgrade="sudo apt-get update && sudo apt-get upgrade"
    alias update="sudo apt-get update"
    alias aptf="apt-cache search"
fi
