source-directory=`pwd`
src=$(source-directory)/rc.lua
src2=$(source-directory)/theme.lua
target-directory=~/.config/awesome
target=$(target-directory)/rc.lua
target2=$(target-directory)/theme.lua

install: clean
	mkdir -p $(target-directory)
	ln -s $(src) $(target)
	ln -s $(src2) $(target2)
clean:
	rm -Rf $(target-directory)

.PHONY: install clean

