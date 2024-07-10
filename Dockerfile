FROM ubuntu:24.04

ENV Xms=1024M
ENV Xmx=2048M

RUN apt-get update && apt-get install --no-install-recommends -y screen && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /minecraft

COPY forge-1.12.2-14.23.5.2860-installer.jar .

# This is necessary to avoid the need to use Git LFS
COPY jdk-8u411-linux-x64.tar.gz.* /minecraft/

RUN cat jdk-8u411-linux-x64.tar.gz.* > jdk1.8.0_411.tar.gz && rm jdk-8u411-linux-x64.tar.gz.*

RUN tar -zxf jdk1.8.0_411.tar.gz && rm jdk1.8.0_411.tar.gz

RUN chmod +x /minecraft/jdk1.8.0_411/bin/java

RUN ln -s /minecraft/jdk1.8.0_411/bin/java /usr/bin/

RUN java -jar forge-1.12.2-14.23.5.2860-installer.jar --installServer && rm forge-1.12.2-14.23.5.2860-installer.jar forge-1.12.2-14.23.5.2860-installer.jar.log

WORKDIR /minecraft/server

VOLUME /minecraft/server

EXPOSE 25565

CMD echo "eula=true" > eula.txt && screen -S minecraft -dm java -Xms${Xms} -Xmx${Xmx} -jar ../forge-1.12.2-14.23.5.2860.jar nogui && sleep infinity
