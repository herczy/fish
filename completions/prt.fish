set PRT_EXEC (which prt)
if test ! -z "x$PRT_EXEC" -a -x $PRT_EXEC
  env _PRT_COMPLETE=fish_source $PRT_EXEC | source
end
