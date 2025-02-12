FROM debian:sid-20250203-slim

RUN apt -y -qq update
RUN apt -y -qq install openssh-server joe rsync nmap tcpdump net-tools iputils-ping telnet psmisc
RUN apt -y purge systemd
RUN apt -y autoremove
RUN apt -y clean

COPY entrypoint.sh /entrypoint.sh

EXPOSE 2222

ENTRYPOINT ["/entrypoint.sh"]