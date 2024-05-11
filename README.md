# Minecraft Forge Server

`Minecraft Forge Server` is a dockerized minecraft server with support for modifications

## How to build this image

`$ docker build -t minecraft-forge-server .`

## How to run a container based on previously built image

`$ docker run -it -p 25565:25565 minecraft-forge-server`

After a moment you should be able to find a server on your localhost address
