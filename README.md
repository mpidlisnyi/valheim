# My setup

data dir /var/valheim

```
mkdir /var/valheim && chown -R 1888:1888 /var/valheim
```
## worlds migration

In directory C:\Users[username]\AppData\LocalLow\IronGate\Valheim\worlds choose our local world files by name and copy them to /var/valheim/worlds on server
in my case world name is "First"

## server start
```
docker run -d \
    --name valheim_first \
    -v /var/valheim:/data \
    -e SERVER_NAME=Some_valheim_server \
    -e SERVER_WORLD=First \ # must be matched with your world name
    -e SERVER_PORT=2456 \
    -e SERVER_PASSWORD="<change me>" \
    -p 0.0.0.0:2456:2456/udp \
    -p 0.0.0.0:2457:2457/udp \
    -p 0.0.0.0:2458:2458/udp \
    --restart unless-stopped \
    --log-driver json-file \
    --log-opt max-size=10m \
    --log-opt max-file=10 \
    mpidlisnyi/valheim
```
