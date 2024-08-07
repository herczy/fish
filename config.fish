set -g -x PATH /home/herczy/.local/bin /opt/nvim/bin /opt/zig-linux-x86_64-0.12.0 $PATH
set -g -x EDITOR nvim
alias vim=nvim

set fish_greeting

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/herczy/miniconda3/bin/conda
    eval /home/herczy/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/herczy/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/herczy/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/herczy/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

