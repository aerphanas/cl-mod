LISP=qlot exec ros run

all: build run

run: cl-mod
	@./cl-mod

rebuild: clean build

build: cl-mod.asd
	@$(LISP) --eval "(require :cl-mod)"   \
		 --eval "(asdf:make :cl-mod)" \
		 --quit

test: cl-mod.asd
	@$(LISP) --eval "(require :cl-mod)"          \
		 --eval "(asdf:test-system :cl-mod)" \
		 --quit

clean: cl-mod
	@rm -f cl-mod

