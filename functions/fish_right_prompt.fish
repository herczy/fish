function fish_right_prompt
  set last_status $status

  # Git-related stuff
  set current_branch (git branch 2>/dev/null | grep '*' | cut -d' ' -f 2)
  if test "x$current_branch" != "x"
    set pwd (pwd)
    set untracked (git branch 2>/dev/null | grep '(HEAD detached' | wc -l)

    while test $pwd != "/"
      if test -d $pwd/.git
        break
      end

      set pwd (dirname $pwd)
    end

    printf "%s\ubb %s " (set_color yellow) (basename $pwd)

    if test $untracked -eq 0
      printf "%s\u21b3 %s" (set_color -o blue) $current_branch

      if test (git branch -r | grep "origin/$current_branch" | wc -l) -gt 0
        set commits (git log --oneline "origin/$current_branch..HEAD" | wc -l)

        if test $commits != 0
          printf " %sunpushed:%s " (set_color -o yellow) $commits
        end
      end
    else
      printf "%s\u21b3 %s" (set_color -o brred) "untracked"
    end

    set added (count (git status --porcelain | grep '^A '))
    set modified (count (git status --porcelain | grep '^ M'))
    set deleted (count (git status --porcelain | grep '^ D'))
    set untracked (count (git status --porcelain | grep '^??'))
    set total (count (git status --porcelain))

    if test $total -ne 0
      printf " %s\ub1%s -%s +%s ?%s%s" (set_color -b red brwhite) $modified $deleted $added $untracked (set_color -b normal)
    end 
  end

  # Status code
  printf ' '
  if test $last_status -eq 0
    set_color brgreen
    printf '\u2713'
  else
    set_color -o brred
    printf '\u2717%s' $last_status
  end

  set_color -b normal normal
end
