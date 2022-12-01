source-directory=`pwd`
src=$(source-directory)/config
target-directory=~/.config/youtube-dl
target=$(target-directory)/config

install: clean
	mkdir -p $(target-directory)
	ln -s $(src) $(target)
clean:
	rm -Rf $(target-directory)

.PHONY: install clean
