#!/bin/bash

VUV_VENV="$HOME/.venvs" #虚拟环境地址
VUV_DIR="$HOME/.vuv"    #安装位置
VUV_CONFIG="$VUV_DIR/.vuv_config"   #配置文件位置

if ! command uv -V &> /dev/null; then
    echo "Error: uv is not installed" >&2
    return 1
fi

# 检查vuv是否存在
if [ ! -f "vuv" ]; then
    echo "Error: vuv script not found in current directory."
    exit 1
fi

echo "Please select your terminal:"
echo "1) bash"
echo "2) zsh"
read -p "Enter the number corresponding to your terminal: " terminal_choice

case $terminal_choice in
    1)
        echo "export VUV_VENV=$VUV_VENV" >> "$HOME/.bashrc"
        echo "export VUV_CONFIG=$VUV_CONFIG" >> "$HOME/.bashrc"
        echo "source $VUV_DIR/vuv" >> "$HOME/.bashrc"
        echo "source $VUV_CONFIG" >> "$HOME/.bashrc"
        echo "Added 'VUV_VENV','VUV','VUV_CONFIG' to .bashrc"
        ;;
    2)
        echo "export VUV_VENV=$VUV_VENV" >> "$HOME/.zshrc"
        echo "export VUV_CONFIG=$VUV_CONFIG" >> "$HOME/.zshrc"
        echo "source $VUV_DIR/vuv" >> "$HOME/.zshrc"
        echo "source $VUV_CONFIG" >> "$HOME/.zshrc"
        echo "Added 'VUV_VENV','VUV','VUV_CONFIG' to .zshrc"
        ;;
    *)
        echo "Invalid choice. No changes made."
        exit 1
        ;;
esac

# 创建VUV_DIR目录
mkdir -p "$VUV_VENV"

# 创建VUV_DIR目录
mkdir -p "$VUV_DIR"

# 复制vuv脚本
cp vuv "$VUV_DIR"
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy vuv script to $VUV_DIR"
    exit 1
fi

# 创建VUV_CONFIG
touch "$VUV_CONFIG"

# 如果安装了conda则禁用
if command conda -V &> /dev/null; then
    echo "Trun off conda base environment"
    conda config --set auto_activate_base false
fi

echo "Installation complete, please restart your terminal."