source-directory=`pwd`
target-directory=~/.config/sxhkd
source=$(source-directory)/sxhkdrc
target=$(target-directory)/sxhkdrc

install: clean
	mkdir -p $(target-directory)
	ln -s $(source) $(target)

clean:
	rm -f $(target)
