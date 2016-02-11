# if (( ${+commands[keychain]} )); then
#     if [[ -d $HOME/.ssh ]]; then
#         if [[ -f $HOME/.ssh/id_dsa ]]; then
#             eval `keychain --eval --nogui -Q -q ~/.ssh/id_dsa`
#         elif [[ -f $HOME/.ssh/id_rsa ]]; then
#             eval `keychain --eval --nogui -Q -q ~/.ssh/id_rsa`
#         fi
#     fi
# fi
if [ -f "${HOME}/.gpg-agent-info"  ]; then
    . "${HOME}/.gpg-agent-info"
    export GPG_AGENT_INFO
    export SSH_AUTH_SOCK
    export SSH_AGENT_PID
fi
