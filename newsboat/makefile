source-directory=`pwd`
target-directory=~/.config/newsboat
source-urls=$(source-directory)/urls
target-urls=$(target-directory)/urls
source-config=$(source-directory)/config
target-config=$(target-directory)/config

install: clean
	mkdir -p $(target-directory)
	ln -s $(source-urls) $(target-urls)
	ln -s $(source-config) $(target-config)
clean:
	rm -f $(target-urls)
	rm -f $(target-config)
