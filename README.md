# Some Neovim configuration to soothe the soul

Clone into your neovim config dir. The Lazy bootstrap should ensure you get an initial sync.

Lazy should take care of all Neovim packages. Some extra setup needs to be done.

## Font(s)

Get the "ShureTechMono Nerd Font" from https://www.nerdfonts.com/font-downloads

## For Unity projects on Mac
1. install dotnet and mono (Homebrew).
2. add to ~/.zprofile:
	* ```export DOTNET_ROOT=/usr/local/share/dotnet```
	* ```export FrameworkPathOverride=/opt/homebrew/lib/mono/4.7.1-api```
