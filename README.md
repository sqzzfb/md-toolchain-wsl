# WSL Molecular Dynamics Toolchain

A reproducible installation toolkit on WSL-Debian for:

- Packmol
- Moltemplate
- LAMMPS (MPI enabled)

---

## 1. Install WSL (Windows)
> ⚠️ Run in **PowerShell** or **CMD** on Windows:
```powershell
wsl --install -d Debian
```

## 2. Install Toolchain (Linux)
> ⚠️ Run inside **WSL Debian terminal** (after installation):
```bash
cd && \
rm -rf md-toolchain-wsl && \
git clone https://github.com/sqzzfb/md-toolchain-wsl.git && \
cd md-toolchain-wsl/linux && \
chmod +x install_all.sh && \
./install_all.sh
```
