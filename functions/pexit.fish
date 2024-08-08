function pexit
  argparse "a/all" -- $argv

  if test -n $_flag_all
    while test $CONDA_SHLVL -gt 1
      conda deactivate
    end

    cd $PENTER_DIRS[1]
    set -e PENTER_DIRS
    return
  end

  if test -z "$PENTER_DIRS"
    echo 'Not in a project file'
    return
  end

  set last $PENTER_DIRS[-1]
  set -g PENTER_DIRS $PENTER_DIRS[..-2]

  conda deactivate
  cd $last
end
