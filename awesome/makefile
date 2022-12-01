source-directory=`pwd`
src=$(source-directory)/rc.lua
target-directory=~/.config/awesome
target=$(target-directory)/rc.lua

install: clean
	mkdir -p $(target-directory)
	ln -s $(src) $(target)
clean:
	rm -Rf $(target-directory)

.PHONY: install clean

