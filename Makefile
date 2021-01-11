all: src/main.cr
	crystal build src/main.cr -o lvim

install: lvim
	mv lvim /usr/local/bin

