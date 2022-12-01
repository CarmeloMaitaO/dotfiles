source-directory=`pwd`
target-directory=~/.config
source-dir=$(source-directory)/user-dirs.dirs
target-dir=$(target-directory)/user-dirs.dirs
source-locale=$(source-directory)/user-dirs.locale
target-locale=$(target-directory)/user-dirs.locale

install: clean
	mkdir -p $(target-directory)
	ln -s $(source-dir) $(target-dir)
	ln -s $(source-locale) $(target-locale)
	xdg-user-dirs-update
	
clean:
	rm -f $(target-dir)
	rm -f $(target-locale)
