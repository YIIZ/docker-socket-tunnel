FROM alpine
RUN apk add --no-cache openssh
RUN ssh-keygen -A
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd", "-D"]
