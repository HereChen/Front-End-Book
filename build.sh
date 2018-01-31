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
  mkdir -p ${temp_folder}/$1/markdown
  cp -r $1/*.md ${temp_folder}/$1/markdown

  # delete ignore files, if exist
  for file in ${ignore_files[@]}
  do
    echo delete ${temp_folder}/$1/markdown/${file}
    rm ${temp_folder}/$1/markdown/${file}
  done
}

# convert to single file
markdown_to_one() {
  # .tmp
  mkdir -p ${temp_folder}/$1/markdown
  pandoc -s ${temp_folder}/$1/markdown/*.md -o ${temp_folder}/$1/markdown/main.md

  # dist
  mkdir -p ${dist_folder}/$1/markdown
  cp -r ${temp_folder}/$1/markdown/main.md ${dist_folder}/$1/markdown/
}

markdown_to_html() {
  # .tmp
  mkdir -p ${temp_folder}/$1/html
  pandoc -s ${temp_folder}/$1/markdown/main.md -o ${temp_folder}/$1/html/main.html

  # dist
  mkdir -p ${dist_folder}/$1/html
  cp -r ${temp_folder}/$1/html/main.html ${dist_folder}/$1/html/
}

markdown_to_latex() {
  # .tmp
  mkdir -p ${temp_folder}/$1/latex
  pandoc --listings ${temp_folder}/$1/markdown/main.md -o ${temp_folder}/$1/latex/content.tex

  cp ${source_folder}/${1}_title.tex ${temp_folder}/$1/latex/title.tex
  cp ${source_folder}/format.cls ${temp_folder}/$1/latex/
  cp ${source_folder}/main.tex ${temp_folder}/$1/latex/

  # dist
  mkdir -p ${dist_folder}/$1/latex
  cp -r ${temp_folder}/$1/latex/* ${dist_folder}/$1/latex/
}

latex_to_pdf(){
  # .tmp
  cd ${temp_folder}/$1/latex/
  pwd
  xelatex main.tex
  xelatex main.tex
  cd ../../../
  pwd

  # dist
  mkdir -p ${dist_folder}/$1/pdf
  cp ${temp_folder}/$1/latex/*.pdf ${dist_folder}/$1/pdf/
}

markdown_to_docx() {
  # .tmp
  mkdir -p ${temp_folder}/$1/docx
  pandoc -s ${temp_folder}/$1/markdown/main.md -o ${temp_folder}/$1/docx/main.docx

  # dist
  mkdir -p ${dist_folder}/$1/docx
  cp ${temp_folder}/$1/docx/main.docx ${dist_folder}/$1/docx/
}

main() {
  clean
  for folder in ${markdown_section_folders[@]}
  do
    rm ${dist_folder}/${folder}
    echo ====== build ${folder} ======
    # must
    markdown_src_tmp ${folder}
    markdown_to_one ${folder}

    # option
    markdown_to_html ${folder}

    # option
    markdown_to_latex ${folder}
    latex_to_pdf ${folder}

    # option
    markdown_to_docx ${folder}
    echo ====== FINISHED build ${folder} ======
  done

  rm -rf ${temp_folder}
}

main
