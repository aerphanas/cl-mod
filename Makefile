LISP   ?= qlot exec ros run
PREFIX ?= '/usr/local/bin'

.PHONY: build
build: cl-mod.asd
	@ $(LISP) --eval "(require :cl-mod)"   \
		 --eval "(asdf:make :cl-mod)" \
		 --quit
.PHONY: test
test: cl-mod.asd
	@ $(LISP) --eval "(require :cl-mod)"          \
		 --eval "(asdf:test-system :cl-mod)" \
		 --quit

.PHONY: install
install: cl-mod
	@ echo "installing cl-mod to /usr/local/bin"
	@ mkdir -p '${PREFIX}'
	@ install -m 755 cl-mod '${PREFIX}'

.PHONY: uninstall
uninstall:
	@ echo "uninstalling cl-mod..."
	@ rm '${PREFIX}/cl-mod'
