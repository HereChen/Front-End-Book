# global
# markdown_section_folders=("fundamental" "frameworks" "solutions" "optimization" "tools")
markdown_section_folders=("fundamental" "frameworks" "solutions" "optimization")
ignore_files=("README.md")
temp_folder=.tmp
source_folder=src
dist_folder=dist

# delete file in current folder
delete_by_extension() {
  find . -name $1 -type f -delete
}

# clean buld temp files
clean() {
  echo ============ clean compile temp files ============
  build_extensions=("*.aux" "*.bak" "*.log" "*.bbl" "*.dvi" "*.blg" "*.thm" "*.toc" "*.out" "*.lof" "*.lol" "*.lot" "*.fdb_latexmk" "*.synctex.gz" "*.bcf" "*.nav" "*.snm" "*.xdv" "*.vrb" "*.fls")

  rm -rf ${temp_folder}

  # clean latex build
  for ext in ${build_extensions[@]}
  do
    echo delete ${ext}
    delete_by_extension ${ext}
  done
  echo ============ DONE clean compile temp files ============
}

markdown_src_tmp() {
  # .tmp
  mkdir -p ${temp_folder}/$1/markdown;
  cp -r $1/*.md ${temp_folder}/$1/markdown;

  # delete ignore files, if exist
  for file in ${ignore_files[@]}
  do
    echo delete ${temp_folder}/$1/markdown/${file}
    rm ${temp_folder}/$1/markdown/${file}
  done
}

markdown_to_latex() {
  pandoc --listings ${temp_folder}/$1/markdown/*.md -o ${temp_folder}/$1/content.tex

  cp ${source_folder}/format.cls ${temp_folder}/$1/
  cp ${source_folder}/title.tex ${temp_folder}/$1/
  cp ${source_folder}/main.tex ${temp_folder}/$1/

  # ${dist_folder}/*/latex
  mkdir -p ${dist_folder}/$1/latex
  cp -r ${temp_folder}/$1/* ${dist_folder}/$1/latex/
}

latex_to_pdf(){
  cd ${temp_folder}/$1/
  pwd
  xelatex main.tex
  xelatex main.tex
  cd ../../
  pwd

  mkdir -p ${dist_folder}/$1/pdf
  cp ${temp_folder}/$1/*.pdf ${dist_folder}/$1/pdf/
}

markdown_to_docx() {
  mkdir -p ${dist_folder}/$1/docx
  pandoc -s $1/*.md -o ${dist_folder}/$1/docx/main.docx
}

main() {
  clean
  for folder in ${markdown_section_folders[@]}
  do
    echo ====== build ${folder} ======
    markdown_src_tmp ${folder}
    markdown_to_latex ${folder}
    latex_to_pdf ${folder}
    markdown_to_docx ${folder}
    echo ====== FINISHED build ${folder} ======
  done

  rm -rf ${temp_folder}
}

main
