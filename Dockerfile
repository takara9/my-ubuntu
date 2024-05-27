# syntax=docker/dockerfile:1
FROM ubuntu:22.04

# モジュールをインストール
RUN apt update
RUN apt-get install -y python3=3.10.6-1~22.04 python3-pip=22.0.2+dfsg-1ubuntu0.4 iputils-ping=3:20211215-1 dnsutils=1:9.18.18-0ubuntu0.22.04.2 curl=7.81.0-1ubuntu1.16  iproute2=5.15.0-1ubuntu2 zip=3.0-12build2 unzip=6.0-26ubuntu3.2 groff=1.22.4-8build1
RUN curl -LJO https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
RUN mv yq_linux_amd64 /usr/local/bin/yq && chmod a+x /usr/local/bin/yq
RUN ARCH=`arch` && curl "https://awscli.amazonaws.com/awscli-exe-linux-$ARCH.zip" -o "awscliv2.zip" 
RUN unzip awscliv2.zip && ./aws/install && rm /awscliv2.zip && rm -fr /aws
WORKDIR /
USER 65534:65534

# コンテナの停止防止
CMD ["tail", "-f", "/dev/null"]