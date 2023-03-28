source-directory=`pwd`
target-directory=~/.config/nyxt
source-init=$(source-directory)/init.lisp
target-init=$(target-directory)/init.lisp
source-extensions=$(source-directory)/extensions
target-extensions=~/.config/nyxt/extensions

install: clean
	mkdir -p $(target-directory)
	ln -sf $(source-init) $(target-init)
	ln -sf $(source-extensions) $(target-extensions)
clean:
	rm -f $(target-init)
	rm -f $(target-directory-extensions)
