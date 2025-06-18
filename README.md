# SHIHONG SHELL

**SHIHONG SHELL** 是一個設計給 Termux 使用者的進階 `.bashrc` 登入系統，它整合了安全性、美學與實用性，讓每次打開終端機都像進入一個專屬工作環境。

## 📌 專案目標
本專案的目的是為了提供一套「進入終端機前的儀式性安全保護機制」，同時結合即時狀態顯示與自我風格呈現，提升終端機使用體驗的完整性與識別性。

## 🚀 功能特色
- 密碼保護登入
- Ctrl+C 封鎖防繞過
- 緊急跳過機制（SKIP_LOGIN）
- 雕像 ASCII 藝術畫面
- 系統資訊面板（時間、公網/區網 IP、備份狀態）
- 語錄顯示（可擴充）

## 📦 安裝
1. 安裝相依套件：
   ```bash
   pkg install curl jq termux-api
   ```
2. 將 `.bashrc.shihong` 複製為 `~/.bashrc`
3. 將 `shihong_ascii_mobile.txt` 放入 `~/`
4. 可建立 `~/.bashrc.safe` 備份以便還原

## 🆘 緊急模式
若 `.bashrc` 當機無法進入終端機：
```bash
env SKIP_LOGIN=true bash
```

## 🙋‍♂️ 作者
由 eric039eric（士弘）設計，整合哲學、美學與技術控制於終端登入過程中。
