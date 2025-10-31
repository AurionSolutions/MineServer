@echo off
docker rm -f mineserver 
docker run -d -p 25565:25565 -p 19132:19132 --name mineserver mineserver:latest
pause