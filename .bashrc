# === SKIP_LOGIN 跳過模式檢查 ===
if [[ "SKIP_LOGIN" == "true" ]]; then
  return
fi

# ===防止 Ctrl+C 中斷 ===
trap 'echo -e "\n\033[1;31m[⛔️] 禁止中斷！強制退出……\033[0m"; exit 1' SIGINT

# === 安全啟動機制（密碼驗證） ===
CORRECT_PASSWORD="eric2916"

# === 顯示外部 IP（需 curl)
EXT_IP=$(curl -s https://ifconfig.me || echo "無法取得")

# === 顯示本機 IP(以 wlan0 為主）
LOCAL_IP=$(termux-wifi-connectioninfo | jq -r '.ip' 2>/dev/null)

echo -n "🔐 請輸入啟動密碼："
read -s input_password
echo

if [ "$input_password" != "$CORRECT_PASSWORD" ]; then
  echo -e "\033[1;31m[❌️] 密碼錯誤，終端機即將關閉……\033[0m"
  sleep 1
  exit 1
fi

echo -e "\033[1;32m[✅️] 身份驗證通過，啟動 SHIHONG 終端系統……\033[0m"
sleep 0.5

# === 門禁動畫效果 ===
echo -e "\033[1;31m[🔒] 驗證用戶身份中……\033[0m"; sleep 0.6
echo -e "\033[1;33m[🔑] 驗證主密鑰……\033[0m"; sleep 0.6
echo -e "\033[1;36m[🧠] 讀取模型：AEON 驗證中……\033[0m"; sleep 0.8
echo -e "\033[1;32m[✅️] SHIHONG 身份驗證完成，存取已授權！\033[0m"; sleep 0.4
echo

# === 顯示 ASCII 頭像 ===
cat ~/shihong_ascii.txt
sleep 0.5

# === 系統資訊面板 ===
echo -e "\033[1;32m========================================\033[0m"
echo -e "\033[1;32m        🔐 SHIHONG TERMINAL SYSTEM        \033[0m"
echo -e "\033[1;32m========================================\033[0m"

# === 顯示基本狀態資訊 ===
echo -e "\033[1;34m[🕒] 時間：\033[0m$(date '+%Y/%m/%d %H:%M:%S')"
echo -e "\033[1;34m[⚡️] 電池：\033[0m$(termux-battery-status | grep percentage | awk '{print $2}' | sed 's/,//')%"
echo -e "[🌐] 公網IP：$EXT_IP"
echo -e "[📊] 區網IP：${LOCAL_IP:-無法取得}"
echo -e "\033[1;34m[💾] 備份狀態：\033[0m最近備份檔案 $(ls -t ~/backups/backup_*.tar.gz 2>/dev/null | head -1 | xargs basename)"

# === 啟動 crond 如果還沒啟動 ===
ps aux | grep crond | grep -v grep > /dev/null || crond
echo -e "\033[1;32m[✅️] crond 啟動完成\033[0m"
echo

# === 顯示哲學語錄 ===
echo -e "\033[1;36m 「我們可以用心的視角來看待世界，"
echo -e "這可能是新的思想牢籠，也可能是新的思想大解放。」\033[0m"
echo
echo -e "\033[1;32m========================================\033[0m"