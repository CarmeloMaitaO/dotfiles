source-directory=`pwd`
src=$(source-directory)/config.conf
target-directory=~/.config/neofetch
target=$(target-directory)/config.conf

install: clean
	mkdir -p $(target-directory)
	ln -s $(src) $(target)
clean:
	rm -Rf $(target-directory)

.PHONY: install clean

