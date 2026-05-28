#!/bin/bash
set -e

echo "===================================="
echo " MD Toolchain WSL Installer"
echo " Packmol + Moltemplate + LAMMPS"
echo "===================================="

# ==============================
# 0. 基础目录
# ==============================
mkdir -p ~/cal
cd ~/cal

# ==============================
# 1. 系统依赖
# ==============================
echo "[1/4] Installing system dependencies..."

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
    gfortran make wget tar git \
    python3 python3-pip python3-venv python3-numpy python-is-python3 \
    cmake g++ openmpi-bin libopenmpi-dev \
    libfftw3-dev libjpeg-dev libpng-dev

# ==============================
# 2. Packmol
# ==============================
echo "[2/4] Installing Packmol..."

if [ ! -d "packmol-master" ]; then
    wget https://github.com/m3g/packmol/archive/refs/heads/master.tar.gz
    tar -xzf master.tar.gz
fi

cd packmol-master
make

PACKMOL_PATH="$(pwd)"
cd ~/cal

# ==============================
# 3. Moltemplate
# ==============================
echo "[3/4] Installing Moltemplate..."

if [ ! -d "moltemplate" ]; then
    git clone https://github.com/jewettaij/moltemplate.git
fi

# ==============================
# 4. LAMMPS
# ==============================
echo "[4/4] Installing LAMMPS..."

if [ ! -d "lammps" ]; then
    git clone --depth=1 -b stable https://github.com/lammps/lammps.git
fi

cd lammps
mkdir -p build
cd build

cmake ../cmake \
  -D PRESET=most \
  -D BUILD_MPI=yes \
  -D PKG_REAXFF=yes

make -j$(nproc)
make install

# ==============================
# 5. 环境变量
# ==============================
echo "[5/4] Setting environment variables..."

cat << 'EOF' >> ~/.bashrc

# ===== MD TOOLCHAIN WSL START =====
export PATH="$PATH:$HOME/cal/packmol-master"
export PATH="$PATH:$HOME/cal/moltemplate/moltemplate"
export PATH="$PATH:$HOME/cal/moltemplate/moltemplate/scripts"
export MOLTEMPLATE_PATH="$HOME/cal/moltemplate/moltemplate/common"
export PATH="$PATH:$HOME/.local/bin"
# ===== MD TOOLCHAIN WSL END =====

EOF

source ~/.bashrc

# ==============================
# 完成
# ==============================
echo "===================================="
echo " Installation Completed Successfully"
echo " Please restart terminal"
echo " Test commands:"
echo "   packmol"
echo "   moltemplate.sh"
echo "   lmp -h"
echo "===================================="
