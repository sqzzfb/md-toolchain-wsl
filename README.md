# WSL Molecular Dynamics Toolchain

A reproducible installation toolkit on WSL2-Debian for:

- Packmol
- Moltemplate
- LAMMPS (MPI enabled)

---

## 1. Install WSL (Windows)

```bash
wsl --install -d Debian
```
## 2. Install Toolchain (Linux)
```
cd && \
rm -rf md-toolchain-wsl && \
git clone https://github.com/sqzzfb/md-toolchain-wsl.git && \
cd md-toolchain-wsl/linux && \
chmod +x install_all.sh && \
./install_all.sh
```
