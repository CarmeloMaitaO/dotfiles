source-directory=`pwd`
target-directory=~/.config/wal
source=$(source-directory)/postrun
target=$(target-directory)/postrun

install: clean
	mkdir -p $(target-directory)
	ln -s $(source) $(target)
	
clean:
	rm -f $(target)
