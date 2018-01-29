# global
markdown_section_folders=("fundamental" "frameworks" "solutions" "optimization" "tools")
ignore_files=("READMD.md")

# build sections

# build */main.tex

# build all

# tools
# delete file in current folder
delete_by_extension() {
  find . -name $1 -type f -delete
}

# clean buld temp files
clean() {
  echo ============ clean compile temp files ============
  build_extensions=("*.aux" "*.bak" "*.log" "*.bbl" "*.dvi" "*.blg" "*.thm" "*.toc" "*.out" "*.lof" "*.lol" "*.lot" "*.fdb_latexmk" "*.synctex.gz" "*.bcf" "*.nav" "*.snm" "*.xdv" "*.vrb" "*.fls")

  # clean latex build
  for ext in ${build_extensions[@]}
  do
    echo delete ${ext}
    delete_by_extension ${ext}
  done
  echo ============ DONE clean compile temp files ============
}

markdown_to_latex() {
    mkdir -p .tmp/$1;
    pandoc --listings $1/*.md -o .tmp/$1/content.tex

    cp src/format.cls .tmp/$1/
    cp src/title.tex .tmp/$1/
    cp src/main.tex .tmp/$1/
}

latex_to_pdf(){
    mkdir -p dist/$1/pdf
    xelatex  .tmp/$1/main.tex
    xelatex  .tmp/$1/main.tex
    cp .tmp/$1/*.pdf dist/pdf/
}

markdown_to_docx() {
    mkdir -p dist/docx
    pandoc -s src/markdown/*.md -o dist/docx/main.docx
}

main() {
  clean
  for folder in ${markdown_section_folders[@]}
  do
    markdown_to_latex ${folder}
    latex_to_pdf ${folder}
    # markdown_to_docx
  done

  cp .tmp/**/.pdf dist/
  rm -rf .tmp
}

main
