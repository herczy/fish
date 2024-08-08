function pexit
  while test $CONDA_SHLVL -gt 1
    echo "Deactivating conda environment '$CONDA_DEFAULT_ENV'"
    conda deactivate
  end
end
