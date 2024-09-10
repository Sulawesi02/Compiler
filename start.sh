#!/bin/bash

# 工具安装
sudo apt update && sudo apt install -y build-essential gcc-multilib llvm clang flex bison && sudo apt-get install -y build-essential clang clang-15 gcc git vim ninja-build pkg-config libglib2.0-dev libpixman-1-dev && sudo make install
sudo apt install -y gcc-arm-linux-gnueabihf g++-arm-linux-gnueabihf
# 如果你选择 RISC-V 架构进行实验，先不要使用 apt 安装 qemu
# sudo apt install qemu 直接运行会报错，好像是因为 Ubuntu 将 QEMU 拆分成几十个实际的包，因为 QEMU 非常庞大，几乎没有人真正需要所有组件，而且某些组件实际上存在潜在的安全风险。曾经有一个qemu元包可以容纳所有内容，但它很久以前就被删除了。
# sudo apt install -y qemu-system
# sudo apt install -y qemu-user


# 安装qemu-riscv64 
wget https://download.qemu.org/qemu-7.0.0.tar.xz || exit 1
tar xvJf qemu-7.0.0.tar.xz || exit 1
cd qemu-7.0.0/ || exit 1

./configure --enable-slirp --target-list=riscv64-softmmu,riscv64-linux-user --prefix=/opt/qemu

make -j4
#（如果上一步执行失败并且是报错不缺少某些库，尝试 rm -rf build 后
# 重新执行上一条命令后再 make -j4，如果缺少某些库则自行根据报错信息安装）

echo 'export PATH=$PATH:/opt/qemu/bin:$PATH' >> ~/.bashrc
qemu-system-riscv64 --version

#riscv64 交叉编译 gcc 安装-
echo 'export PATH=/home/xu/projects/Compiler/riscv/riscv64/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
riscv64-unknown-linux-gnu-gcc --version

# 克隆仓库
git init

git clone https://github.com/meyerd/flex-bison-example.git
# 测试方法根据 README.md
