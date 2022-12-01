source-directory=`pwd`
src=$(source-directory)/key-handler
target-directory=~/.config/sxiv/exec
target=$(target-directory)/key-handler

install: clean
	mkdir -p $(target-directory)
	ln -s $(src) $(target)
clean:
	rm -Rf $(target-directory)

.PHONY: install clean

