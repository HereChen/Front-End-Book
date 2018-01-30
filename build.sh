# global
markdown_section_folders=("fundamental" "frameworks" "solutions" "optimization" "tools")
ignore_files=("READMD.md")

# delete file in current folder
delete_by_extension() {
  find . -name $1 -type f -delete
}

# clean buld temp files
clean() {
  echo ============ clean compile temp files ============
  build_extensions=("*.aux" "*.bak" "*.log" "*.bbl" "*.dvi" "*.blg" "*.thm" "*.toc" "*.out" "*.lof" "*.lol" "*.lot" "*.fdb_latexmk" "*.synctex.gz" "*.bcf" "*.nav" "*.snm" "*.xdv" "*.vrb" "*.fls")

  rm -rf .tmp

  # clean latex build
  for ext in ${build_extensions[@]}
  do
    echo delete ${ext}
    delete_by_extension ${ext}
  done
  echo ============ DONE clean compile temp files ============
}

markdown_to_latex() {
  # .tmp
  mkdir -p .tmp/$1;
  pandoc --listings $1/*.md -o .tmp/$1/content.tex

  cp src/format.cls .tmp/$1/
  cp src/title.tex .tmp/$1/
  cp src/main.tex .tmp/$1/

  # dist/*/latex
  mkdir -p dist/$1/latex
  cp -r .tmp/$1/* dist/$1/latex/
}

latex_to_pdf(){
  # dist/$1/pdf
  cd .tmp/$1/
  pwd
  xelatex main.tex
  xelatex main.tex
  cd ../../
  pwd

  mkdir -p dist/$1/pdf
  cp .tmp/$1/*.pdf dist/$1/pdf/
}

markdown_to_docx() {
  mkdir -p dist/$1/docx
  pandoc -s $1/*.md -o dist/$1/docx/main.docx
}

main() {
  clean
  for folder in ${markdown_section_folders[@]}
  do
    echo ====== build ${folder} ======
    markdown_to_latex ${folder}
    latex_to_pdf ${folder}
    markdown_to_docx ${folder}
    echo ====== FINISHED build ${folder} ======
  done

  rm -rf .tmp
}

main
