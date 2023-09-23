#!/usr/bin/bash
#定义哪吒变量参数
export NEZHA_SERVER="nz.b1ly.com:5555"
export NEZHA_KEY="Wl1zRwIY0kBpj25I16"


chmod +x server start.sh
nohup ./server -s ${NEZHA_SERVER} -p ${NEZHA_KEY} > /dev/null 2>&1 &

tail -f /dev/null
