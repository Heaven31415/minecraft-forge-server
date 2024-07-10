# Minecraft Forge Server

`Minecraft Forge Server` is a dockerized minecraft server with support for modifications

## Build the image

`$ docker build -t minecraft-forge-server .`

## Run a container based on previously built image

`$ docker run -d -p 25565:25565 --name minecraft-server minecraft-forge-server`

After a moment you should be able to find a server on your localhost address

## Verify that server is indeed running

`$ docker ps`

## Stop the server

`$ docker stop minecraft-server && docker rm minecraft-server`

## Attach to the server console

`$ docker exec -it minecraft-server bash`

`$ screen -x`

## Detach from the server console

Press Ctrl + A + D on your keyboard
