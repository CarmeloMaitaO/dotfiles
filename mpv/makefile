source-directory=`pwd`
target-directory=~/.config/mpv
source=$(source-directory)/mpv.conf
target=$(target-directory)/mpv.conf

install: clean
	mkdir -p $(target-directory)
	ln -s $(source) $(target)

clean:
	rm -f $(target)
