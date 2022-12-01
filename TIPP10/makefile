source-directory=`pwd`
src=$(source-directory)/TIPP10.conf
target-directory=~/.config/TIPP10
target=$(target-directory)/TIPP10.conf

install: clean
	mkdir -p $(target-directory)
	ln -s $(src) $(target)
clean:
	rm -Rf $(target-directory)

.PHONY: install clean
