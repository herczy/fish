function complete_penter
  for path in (find ~/devel -maxdepth 1 \( -type d -a ! -name '.*' \))
    set BASENAME (basename $path)
    if ! test -d $path/.git
      continue
    end

    echo -e "$BASENAME\tProject"
  end
end


complete -c penter --no-files -a "(complete_penter)"
