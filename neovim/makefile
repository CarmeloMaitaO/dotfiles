source-directory=`pwd`
target-directory=~/.config/nvim
source=$(source-directory)/init.vim
target=$(target-directory)/init.vim

install: clean
	mkdir -p $(target-directory)
	ln -s $(source) $(target)

clean:
	rm -f $(target)
