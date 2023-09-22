#!/usr/bin/bash
#定义哪吒变量参数
export NEZHA_SERVER="aa.bbb.com:5555"
export NEZHA_KEY="E4fOtOlXw3Jg9vMsf"

chmod +x server start.sh

nohup ./server -s ${NEZHA_SERVER} -p ${NEZHA_KEY} > /dev/null 2>&1 &

# 每330秒自动删除垃圾文件
generate_autodel() {
  cat > delete.sh <<EOF
while true; do
  rm -rf /app/.git
  sleep 300
done
EOF
}

generate_autodel
[ -e delete.sh ] && bash delete.sh
tail -f /dev/null
