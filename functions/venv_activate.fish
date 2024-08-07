function venv_activate;
  set current (pwd)
  set name (basename $current)

  source $HOME/.virtualenvs/$name/bin/activate.fish
end
