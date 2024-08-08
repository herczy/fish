function penter
  argparse --min-args=1 --max-args=1 -- $argv; or return
  
  set cwd (pwd)
  set project $argv[1]

  if test -z "$PENTER_DIRS"
    set -g PENTER_DIRS $cwd
  else
    set -g PENTER_DIRS $PENTER_DIRS $cwd
  end

  cd $HOME/devel/$project
  conda activate $project
end
