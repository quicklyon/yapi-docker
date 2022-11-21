FROM bitnami/node:18.7.0-debian-11-r0

LABEL maintainer "qisy qishiyao@easycorp.ltd"

ENV OS_ARCH="amd64" \
    OS_NAME="debian-11" \
    HOME_PAGE="http://yapi.smart-xwork.cn/"

COPY debian/prebuildfs /

ENV TZ=Asia/Shanghai \
    DEBIAN_FRONTEND=noninteractive

ARG IS_CHINA="true"
ENV MIRROR=${IS_CHINA}

# Install render-template
RUN install_packages curl wget zip unzip s6 pwgen cron

RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "render-template" "1.0.1-10" --checksum 5e410e55497aa79a6a0c5408b69ad4247d31098bdb0853449f96197180ed65a4

# Install wait-for-port
RUN . /opt/easysoft/scripts/libcomponent.sh && component_unpack "wait-for-port" "1.01" -c 2ad97310f0ecfbfac13480cabf3691238fdb3759289380262eb95f8660ebb8d1

# Install pm2
RUN install_npm_pkg pm2@5.2.0 -g

# Install yapi
ARG VERSION
ENV APP_VER=${VERSION}
ENV EASYSOFT_APP_NAME="yapi $APP_VER"

RUN mkdir -p /apps/yapi
RUN curl -L http://registry.npm.taobao.org/yapi-vendor/download/yapi-vendor-${VERSION#v}.tgz | tar zxf - -C /tmp \
  && mv /tmp/package /apps/yapi/vendors \
  && cd /apps/yapi/vendors && npm set strict-ssl false && npm install --production --registry https://registry.npm.taobao.org --legacy-peer-deps
ADD config.json.tpl /apps/yapi
ADD checkInit.js /apps/yapi/vendors/server

# Copy yapi config files
COPY debian/rootfs /

# Copy yapi source code
ENV WORKDIR /apps/yapi
WORKDIR $WORKDIR

EXPOSE 3000

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
