source-directory=`pwd`
target-directory=~/.config/zsh
source-comp=$(source-directory)/zcompdump
target-comp=$(target-directory)/.zcompdump
source-login=$(source-directory)/zlogin
target-login=$(target-directory)/.zlogin
source-logout=$(source-directory)/zlogout
target-logout=$(target-directory)/.zlogout
source-profile=$(source-directory)/zprofile
target-profile=$(target-directory)/.zprofile
source-env=$(source-directory)/zshenv
target-env=$(target-directory)/.zshenv
source-rc=$(source-directory)/zshrc
target-rc=$(target-directory)/.zshrc

install: clean
	mkdir -p $(target-directory)
	ln -s $(source-comp) $(target-comp)
	ln -s $(source-login) $(target-login)
	ln -s $(source-logout) $(target-logout)
	ln -s $(source-profile) $(target-profile)
	ln -s $(source-env) $(target-env)
	ln -s $(source-rc) $(target-rc)
clean:
	rm -f $(target-comp)
	rm -f $(target-login)
	rm -f $(target-logout)
	rm -f $(target-profile)
	rm -f $(target-env)
	rm -f $(target-rc)
