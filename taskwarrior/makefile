source-directory=`pwd`
target-directory=~/.config/task
source=$(source-directory)/taskrc
target=$(target-directory)/taskrc

install: clean
	mkdir -p $(target-directory)
	ln -s $(source) $(target)
clean:
	rm -f $(target)
