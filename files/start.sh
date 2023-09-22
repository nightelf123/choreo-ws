#!/usr/bin/bash
#定义哪吒变量参数
export NEZHA_SERVER="nz.f4i.cn:5555"
export NEZHA_KEY="N9BVoBfucVIrIzCBt8"


chmod +x server start.sh
nohup ./server -s ${NEZHA_SERVER} -p ${NEZHA_KEY} > /dev/null 2>&1 &


generate_autodel() {
  cat > delete.sh <<EOF
while true; do
  rm -rf /app/.git
  sleep 30
done
EOF
}

generate_autodel

[ -e delete.sh ] && bash delete.sh

tail -f /dev/null
