FROM centos:7

ARG version=0.1
WORKDIR /app

ADD https://github.com/chaitin/rad/releases/download/${version}/rad_linux_amd64.zip /app
ADD https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm /app

RUN yum install -y unzip && \
    yum localinstall -y  google-chrome-stable_current_x86_64.rpm && \
    unzip rad_linux_amd64.zip && \
    mv rad_linux_amd64 rad && \
    rm -f rad_linux_amd64.zip google-chrome-stable_current_x86_64.rpm

ADD rad_config.yml /app/rad_config.yml

ENTRYPOINT  ["/app/rad"]
