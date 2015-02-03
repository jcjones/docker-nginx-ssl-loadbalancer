# nginx-ssl-loadbalancer

This container enables a TLS load balancer for application servers using nginx. This is based on the [Offical nginx container, 1.7](https://registry.hub.docker.com/_/nginx/)

The official location of this container is https://quay.io/repository/jcjones/nginx-ssl-loadbalancer .

This balancer comes with initial support for 5 app servers in a round-robin configuration. Future updates will add server configurability.

# Usage

Mount your TLS keys to `/ssl`, preferably read-only.

## Running the Image

You need to use `--add-host` to indicate the upstream servers to utilize.
The server names are:

1. app1
2. app2
3. app3
4. app4
5. app5

Leaving one blank has no more effect than nginx considering the host down.

The general form of the command would be:

```
docker run -d \
  --name lb \
  --add-host app1:192.168.1.1  \
  --add-host app2:192.168.1.2  \
  -v /path/to/ssl:/ssl:ro \
  -p 443:443 -p 80:80 \
  quay.io/jcjones/nginx-ssl-loadbalancer
```

In the volume bound to `/ssl`, you should have `server.key` and `server.crt`, the private key and certificate chain.