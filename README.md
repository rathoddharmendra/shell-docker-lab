# Shell Scripting & Infrastructure Lab
> **Author:** Dee  
> **Date:** April 2026

A comprehensive suite of shell utilities designed for managing system inventories, automating script scaffolding, and deploying projects across **Docker**, **macOS**, and **Oracle Cloud Infrastructure (OCI)**.

---

## 📂 Project Structure

| Path | Description |
| :--- | :--- |
| **`scripts/`** | Core logic and automation files. |
| ↳ `exercises/` | Practice scripts and logic tests. |
| ↳ `standard/` | Production-ready, stable script files. |
| ↳ `data/` | Data storage, including `database/inventory.txt`. |
| **`Makefile`** | Short-cut commands for Docker, OCI, and Local deployments. |

---

## 🛠 Key Utilities

### 1. Script Bootstrapper
Automates the creation of new scripts with a standard header, correct shebang, and immediate executable permissions.
```bash
./bootstrap.sh <filename> "Description of script"