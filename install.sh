#!/bin/bash

VUV_VENV="$HOME/.venvs"
VUV_DIR="$HOME/.vuv"

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
        echo "source $VUV_DIR/vuv" >> "$HOME/.bashrc"
        echo "Added 'export VUV_VENV=$VUV_VENV' and 'source $VUV_DIR/vuv' to .bashrc"
        ;;
    2)
        echo "export VUV_VENV=$VUV_VENV" >> "$HOME/.zshrc"
        echo "source $VUV_DIR/vuv" >> "$HOME/.zshrc"
        echo "Added 'export VUV_VENV=$VUV_VENV' and 'source $VUV_DIR/vuv' to .zshrc"
        ;;
    *)
        echo "Invalid choice. No changes made."
        exit 1
        ;;
esac

# 创建VUV_DIR目录
mkdir -p "$VUV_DIR"

# 复制vuv脚本
cp vuv "$VUV_DIR"
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy vuv script to $VUV_DIR"
    exit 1
fi

# 如果安装了conda则禁用
if command conda -V &> /dev/null; then
    echo "Trun off conda base environment"
    conda config --set auto_activate_base false
fi

echo "Installation complete, please restart your terminal."