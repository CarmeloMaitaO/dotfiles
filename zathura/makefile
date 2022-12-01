source-directory=`pwd`
src=$(source-directory)/zathurarc
target-directory=~/.config/zathura
target=$(target-directory)/zathurarc

install: clean
	mkdir -p $(target-directory)
	ln -s $(src) $(target)
clean:
	rm -Rf $(target-directory)

.PHONY: install clean
