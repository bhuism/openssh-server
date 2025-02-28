FROM debian:sid-20250203-slim

RUN apt -y -qq update
RUN apt -y -qq install openssh-server joe rsync nmap tcpdump net-tools iputils-ping telnet psmisc lsb-release wget curl locales-all bind9-dnsutils
RUN apt -y autoremove
RUN apt -y clean

RUN sed -i 's/#Port 22/Port 2222/g' /etc/ssh/sshd_config
RUN sed -i 's/#ClientAliveInterval 0/ClientAliveInterval 2/g' /etc/ssh/sshd_config

EXPOSE 2222/TCP

ENTRYPOINT [ "/bin/sh", "-c", "/etc/init.d/ssh start ; while [ ! -f /tmp/shutdown ]; do sleep 1 ; done ; /etc/init.d/ssh stop" ]
