# How to bind Windows folder with WSL and DevContainer (Only on Windows)

Sometimes you already have a folder in your Windows machine and you want to use it in your DevContainer. Like you have created your project on GitHub, and you cloned it on your Windows machine, and now you want to use it in your devcontainer, and, use it with WSL.

## Prerequisites

- You are on windows ;
- [Docker](https://docs.docker.com/get-docker/) must be installed ;
- [WSL](https://docs.microsoft.com/en-us/windows/wsl/install-win10) must be installed ;
- [Visual Studio Code](https://code.visualstudio.com/download) must be installed ;
- [Visual Studio Code Extensionv - Dev containers](https://code.visualstudio.com/docs/remote/containers) must be installed in Visual Studio Code ;
- [Visual Studio Code Extension - Remote - WSL](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-wsl) must be installed in Visual Studio Code ;

### Steps

1. Open Visual Studio Code ;
2. Open the folder you want to use in your devcontainer, you can do it two ways:
	 - By clicking on the bottom left corner of Visual Studio Code, and selecting "Open Folder in WSL" ;
	 - Or by open the "View" menu, and selecting "Command Palette", and then, type "WSL" and select "Remote-WSL: Open Folder in WSL..." ;
3. Once you have opened your folder in WSL, you can open the command palette again, and type "Remote-Containers: Add Development Container Configuration Files..." ;

And after that you will have a new file in your folder, named "devcontainer.json", on WSL and Windows.

## Conclusion

Now you can use your folder in your devcontainer, and use it with WSL while it is an existing folder on your Windows machine.



