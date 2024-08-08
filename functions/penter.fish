function penter
  argparse --min-args=1 --max-args=1 -- $argv; or return
  set PROJECT $argv[1]
  echo $PROJECT
  cd $HOME/devel/$project
  conda activate $project
end
