+++
title = "Fancy lightweight prompts for Eshell and Zsh"
description = "I started using the Zsh a few years ago and I’ve liked its completion features. I tried out Oh-my-zsh for a while and I liked the stock Robby Russel prompt. It gave me all the information I cared about: the status of the last command, current directory, and the state of the curre"
date = "2024-08-19T00:00:00Z"
url = "https://lambdaland.org/posts/2024-08-19_fancy_eshell_prompt/"
author = """

            
              Ashton Wiersdorf
            
          """
text = ""
lastupdated = "2026-07-21T09:22:07.218586820Z"
seen = false
+++

I started using the Zsh a few years ago and I’ve liked its completion features. I tried out Oh-my-zsh for a while and I liked the stock Robby Russel prompt. It gave me all the information I cared about: the status of the last command, current directory, and the state of the current Git repository.

However, I didn’t like how slow Oh-my-zsh was making my shell startup. This mattered especially, I think, because my Emacs config would fire up a shell on startup to read the `ENV` so it could configure some language servers properly. Irked at how long stuff was taking, I set out to build my own.

Fancy Zsh prompt, no extra packages needed
----------

Here’s the code for my Zsh prompt:

```
# This is important to make some things play nicely with Emacs.
# They're not critical to the shell prompt per se, but I think they're
# pretty useful.

# Bail out of rest of setup if we're coming in from TRAMP
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ ' && return

[ -n "$EAT_SHELL_INTEGRATION_DIR" ] && source "$EAT_SHELL_INTEGRATION_DIR/zsh"

# This tells the shell to expand the call to $(git_prompt_info)
setopt PROMPT_SUBST

# This is a function that gathers information about the current HEAD.
# It will show the name of the branch if there is one, otherwise the
# short hash of the currently checked-out commit.
git_prompt_info () {
    local ref
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref=$(git rev-parse --short HEAD 2> /dev/null) || return 0

    local STATUS
    local -a FLAGS

    FLAGS=('--porcelain')

    if [[ "${DISABLE_UNTRACKED_FILES_DIRTY:-}" == "true" ]]
    then
    FLAGS+='--untracked-files=no'
    fi
    case "${GIT_STATUS_IGNORE_SUBMODULES:-}" in
    (git)  ;;
    (*) FLAGS+="--ignore-submodules=${GIT_STATUS_IGNORE_SUBMODULES:-dirty}"  ;;
    esac

    STATUS=$(git status ${FLAGS} 2> /dev/null | tail -n1)

    if [[ -n $STATUS ]]
    then
    echo " %F{red}[%F{yellow}${ref#refs/heads/}%F{red}]%f"
    else
    echo " %F{green}(%F{yellow}${ref#refs/heads/}%F{green})%f"
    fi

}

# If I'm on my home machine, don't show the hostname in the prompt.
if [[ `hostname` =~ ^my-home-machine.* ]]
then
    PROMPT="%(?:%F{green}➤:%F{red}!%?)%f %F{cyan}%~%f\$(git_prompt_info) %(!:# :)"
else
    # Add "%m" to print the short hostname on other servers
    PROMPT="%(?:%F{green}➤:%F{red}!%?)%f %F{blue}%m%f:%F{cyan}%~%f\$(git_prompt_info) %(!:# :)"
fi
```

Here’s what the shell looks like in a clean repository:

![](/img/fancy_shells/clean.png)

And here’s what it looks like in a repository with some uncommitted changes:

![](/img/fancy_shells/dirty.png)

The green prompt will change to a red `!` and show the exit status of the last command if it was anything other than 0.

This should run pretty quick. The Git functions take almost no time to run, and the rest is straight-line Zsh script. Using this I was able to stop using Oh-my-zsh and dramatically reduce my shell startup time.

Eshell prompt
----------

I recently started using [Eshell](https://www.masteringemacs.org/article/complete-guide-mastering-eshell) in Emacs, and I wanted the same prompt there as I had in my terminal. Here’s how I got the same prompt, using some functions for the incomparable [Magit](https://magit.vc/) Git porcelain.

First, you need to define a function that generates the prompt for the current directory:

```
(defun fancy-shell ()
  "A pretty shell with git status"
  (let* ((cwd (abbreviate-file-name (eshell/pwd)))
         (ref (magit-get-shortname "HEAD"))
         (stat (magit-file-status))
         (x-stat eshell-last-command-status)
         (git-chunk
          (if ref
              (format "%s%s%s "
                      (propertize (if stat "[" "(") 'font-lock-face (list :foreground (if stat "red" "green")))
                      (propertize ref 'font-lock-face '(:foreground "yellow"))
                      (propertize (if stat "]" ")") 'font-lock-face (list :foreground (if stat "red" "green"))))
            "")))
    (propertize
     (format "%s %s %s$ "
             (if (< 0 x-stat) (format (propertize "!%s" 'font-lock-face '(:foreground "red")) x-stat)
               (propertize "➤" 'font-lock-face (list :foreground (if (< 0 x-stat) "red" "green"))))
             (propertize cwd 'font-lock-face '(:foreground "#45babf"))
             git-chunk)
     'read-only t
     'front-sticky   '(font-lock-face read-only)
     'rear-nonsticky '(font-lock-face read-only))))
```

Now that that function is defined, you can tell Eshell to use that to make the shell prompt. (It’s also good to set `eshell-prompt-regexp` so it knows where the prompt begins and ends.)

```
(setopt eshell-prompt-function 'fancy-shell)
(setopt eshell-prompt-regexp "^[^#$\n]* [$#] ")
(setopt eshell-highlight-prompt nil)
```

It looks basically the same as the Zsh prompt, except there’s always a `$` character at the end of the prompt. This is just to make Emacs’ prompt-parsing easier.

If you are curious about using Eshell, you should use Eshell in concert with [Eat](https://codeberg.org/akib/emacs-eat), which runs commands in a little terminal emulator. This makes interactive programs like code REPLs or programs that use character escape codes work correctly. (You can even run `emacs -nw` and have it work! Madness!) I can use Eshell for more than 90% of what I need to do in a shell now, and that’s pretty nice.