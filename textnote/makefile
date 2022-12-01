source-directory=`pwd`
target-directory=~/.config/textnote
source=$(source-directory)/config.yml
target=$(target-directory)/.config.yml

install: clean
	mkdir -p $(target-directory)
	ln -s $(source) $(target)
clean:
	rm -f $(target)
