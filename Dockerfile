FROM node:latest

WORKDIR /home/choreouser

COPY files/* /home/choreouser/

ENV PM2_HOME=/tmp

RUN apt-get update &&\
    apt-get install -y iproute2 vim netcat-openbsd &&\
    npm install -r package.json &&\
    npm install -g pm2 &&\
    addgroup --gid 10010 choreo &&\
    adduser --disabled-password  --no-create-home --uid 10010 --ingroup choreo choreouser &&\
    usermod -aG sudo choreouser &&\
    chmod +x start.sh server &&\
    npm install -r package.json

ENTRYPOINT [ "node", "index.js" ]

USER 10010




# 使用官方 Node.js 镜像作为基础镜像
FROM node:lts-alpine3.18

# 设置工作目录
WORKDIR /index

# 将应用程序文件复制到容器中
COPY . .

EXPOSE 3000

# 安装应用程序的依赖
RUN npm install

# 设置默认的命令，即启动应用程序
CMD ["npm","start.sh","index.js"]
