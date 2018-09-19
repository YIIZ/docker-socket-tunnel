# Docker Socket Tunnel
A docker-machine replacement that take advantage of SSH socket forwarding.


## Usage (by manual)
1. Deploy this on remote machine
```bash
docker run -d --restart=always -p 2377:22 \
  -v /var/run/docker.sock:/var/run/docker.sock:ro \
  -v ~/.ssh/authorized_keys:/root/.ssh/authorized_keys:ro \
  --name docker-socket-tunnel teambun/docker-socket-tunnel
```

2. Forward Docker socket
```bash
ssh -NTL /tmp/docker.sock:/var/run/docker.sock -p 2377 remote
```

3. Connect to remote docker
```bash
unset DOCKER_TLS_VERIFY
export DOCKER_HOST=unix:///tmp/docker.sock

docker ps
```


## Usage (by scripts)
1. Get [scripts](./scripts)
2. Deploy this to remote machine: `dockertunnel-init user@remote`
3. Run docker client: `dockertunnel user@remote docker ps`
