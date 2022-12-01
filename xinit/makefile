source-directory=`pwd`
target-directory=~/
source=$(source-directory)/xinitrc
target=$(target-directory).xinitrc

install: clean
	mkdir -p $(target-directory)
	ln -s $(source) $(target)
clean:
	rm -f $(target)
