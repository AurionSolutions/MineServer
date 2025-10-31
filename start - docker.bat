@echo off
docker rm -f mineserver 
docker run -d --name mineserver -p 25565:25565/tcp -p 25565:25565/udp -p 19132:19132/tcp -p 19132:19132/udp -v /caminho/no/host/minecraft-data:/minecraft/data -v /caminho/no/host/plugins:/minecraft/plugins -v /caminho/no/host/config:/minecraft/config --restart unless-stopped --memory=6g mineserver:latest
pause