# neovim 配置
## Install
- neovim
``` shell
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update && sudo apt install neovim
```
- pynvim
```
python3 -m pip install --user --upgrade pynvim
```
- nodejs, npm
```
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt instal nodejs npm
npm install -g neovim
```
- vim-plug
```
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```
- 插件安装
打开neovim,输入PlugInstall就可以安装所有插件。

## 插件配置
- golang
```
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt install golang
```
在当前shell的配置文件中导入golang代理
```
export GO111MODULE=on
export GOPROXY=https://goproxy.io
```

打开neovim，输入`:GoInstallBinaries`就可以安装go补全、格式化等一系列依赖。

- coc-nvim
1. C/C++补全 clangd
```
sudo apt-get install clangd-12
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
```
2. CMake支持
很多CMake工程项目有很多个头文件、源文件，在使用vim编辑工程项目时，需要生成`compile_commands.json`文件让clangd找到工程的头文件，进而提供补全、提示的功能。
``` makefile
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1
```
对于CMake项目，只需在生成makefile时添加以上命令就可以得到项目的编译命令文件，将该文件拷贝到项目的根目录中，再使用vim打开项目，就可以对识别项目中的头文件，并提供补全、检错等功能。

