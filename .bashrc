
# === SKIP_LOGIN 跳過模式檢查 ===
if [[ "$SKIP_LOGIN" == "true" ]]; then
  return
fi

trap 'echo -e "\n\033[1;31m[🚫] 禁止中斷！強制退出...\033[0m"; exit 1' SIGINT

PASSWORD="yourpassword123"
echo -ne "\033[1;33m🔐 請輸入啟動密碼：\033[0m"
read -s input
echo ""

if [[ "$input" != "$PASSWORD" ]]; then
    echo -e "\033[1;31m[❌] 密碼錯誤，拒絕存取。\033[0m"
    exit 1
fi

echo -e "\033[1;36m[🔒] 驗證用戶身份中……"
sleep 0.5
echo -e "\033[1;33m[🔑] 驗證主密鑰……"
sleep 0.5
echo -e "\033[1;36m[🧠] 讀取模型：AEON 驗證中……"
sleep 0.5
echo -e "\033[1;32m[✅️] SHIHONG 身份驗證完成，存取已授權！\033[0m"
sleep 0.5

cat ~/shihong_ascii_mobile.txt

EXT_IP=$(curl -s https://ifconfig.me || echo "無法取得")
LOCAL_IP=$(termux-wifi-connectioninfo | jq -r '.ip' 2>/dev/null)

echo -e "[🌐] 公網IP：$EXT_IP"
echo -e "[📶] 區網IP：${LOCAL_IP:-無法取得}"
