function fish_prompt
  set_color -o brgreen
  printf "%s@%s:" (whoami) (hostname)

  set prompt (prompt_pwd)
  if echo $prompt | grep -q '^~'
    set_color blue
  else
    set_color red
  end

  echo "$prompt\$ "
end
