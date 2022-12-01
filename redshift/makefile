source-directory=`pwd`
target-directory=~/.config/redshift
source=$(source-directory)/redshift.conf
target=$(target-directory)/redshift.conf

install: clean
	mkdir -p $(target-directory)
	ln -s $(source) $(target)

clean:
	rm -f $(target)
