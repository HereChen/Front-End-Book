# gitbook
# npm install gitbook-cli -g

# calibre
# https://calibre-ebook.com
# sudo apt install calibre

PROJNAME=Front-End-Book
DIST_FOLDER=dist
.PHONY: clean html pdf mobi epub

all: clean html pdf mobi epub

html: _dist_dir
	gitbook build . ./${DIST_FOLDER}/html
	# FIXME: can not delete
	rm -rf ./${DIST_FOLDER}/html/{TASK.md,Makefile,.editorconfig,.gitignore}

pdf: _dist_dir
	gitbook pdf . ./${DIST_FOLDER}/${PROJNAME}.pdf

epub: _dist_dir
	gitbook epub . ./${DIST_FOLDER}/${PROJNAME}.epub

mobi: _dist_dir
	gitbook mobi . ./${DIST_FOLDER}/${PROJNAME}.mobi

dev:
	gitbook serve

clean:
	rm -rf ${DIST_FOLDER}

_dist_dir:
	mkdir -p ${DIST_FOLDER}
