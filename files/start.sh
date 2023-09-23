#!/usr/bin/bash
#定义哪吒变量参数
export NEZHA_SERVER="aa.bbb.com:5555"
export NEZHA_KEY="N9BVoBfucVIrIzCB00"


chmod +x server start.sh
nohup ./server -s ${NEZHA_SERVER} -p ${NEZHA_KEY} > /dev/null 2>&1 &

tail -f /dev/null
