function complete_penter
  for path in (conda env list --json | jq -r '.envs[]' | grep -v '/.tox/' | grep $HOME/miniconda3/envs/)
    set name (echo $path | sed -e "s,$HOME/miniconda3/envs/,,")
    echo -e "$name\tProject"
  end
end

complete -c penter --no-files -a "(complete_penter)"
