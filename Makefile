#make
#make install_dependencies

.PHONY: all install_dependencies

all: install_dependencies

install_dependencies:
	@echo "Updating system and installing packages..."
	sudo pacman -Syu --noconfirm
	sudo pacman -S --noconfirm clang go git base-devel

	@echo "Installing gopls with go install..."
	# Make sure GOPATH/bin is in PATH or adjust this as needed
	GO_BIN=$(shell go env GOPATH)/bin
	if [ ! -d "$(GO_BIN)" ]; then mkdir -p $(GO_BIN); fi
	PATH=$$PATH:$(GO_BIN) go install golang.org/x/tools/gopls@latest

	@echo "All dependencies installed!"



 