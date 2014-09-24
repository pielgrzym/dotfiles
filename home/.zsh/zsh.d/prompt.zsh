# prompt based on nicoulai prompt from prezto project:
# https://github.com/sorin-ionescu/prezto/blob/master/modules/prompt/functions/prompt_nicoulaj_setup
#
autoload -Uz promptinit && promptinit
setopt prompt_subst

function prompt_precmd {
    vcs_info
}

function prompt_virtualenv {
    if [ ! -z $VIRTUAL_ENV ]; then
        echo "Virtualenv"
    fi
}

function set_prompt {
    # Load required functions.
    autoload -Uz add-zsh-hook
    autoload -Uz vcs_info

    # Add hook for calling vcs_info before each command.
    add-zsh-hook precmd prompt_precmd

    local max_path_chars=30
    local user_char='❯'
    local root_char='❯❯❯'
    local success_color='%F{071}'
    local failure_color='%F{124}'
    local ruby_color='%F{124}'
    local python_color='%F{034}'
    if type rbenv > /dev/null; then
        local ruby_version='R: $(rbenv version | sed -e "s/ .*//")'
    fi
    local virtual_env_name='$(prompt_virtualenv)'

    # Set vcs_info parameters.
    zstyle ':vcs_info:*' enable bzr git hg svn
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' unstagedstr '!'
    zstyle ':vcs_info:*' stagedstr '+'
    zstyle ':vcs_info:*' actionformats "%S" "%r/%s/%b %u%c (%a)"
    zstyle ':vcs_info:*' formats "%F{130}%b%f%F{124}%u%f%F{180}%c%f"
    # zstyle ':vcs_info:*' nvcsformats "%~" ""

    # Define prompts.
    PROMPT="%(?.${success_color}.${failure_color})${SSH_TTY:+[%n@%m]}%B%${max_path_chars}<...<"'%~ ${vcs_info_msg_0_}'"%(?.${success_color}.${failure_color})%<<%(!.${root_char}.${user_char})%b%f "
    RPROMPT="${python_color}${virtual_env_name} ${ruby_color}${ruby_version}%f"
}

set_prompt
# modeline {{{1
# vim: fdm=marker:fdl=0
