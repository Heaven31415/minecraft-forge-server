FROM ubuntu:18.04

ENV Xms=1024M
ENV Xmx=2048M

WORKDIR /minecraft

COPY forge-1.12.2-14.23.5.2768-installer.jar .

COPY jdk-8u231-linux-x64.tar.gz.* /minecraft/

RUN cat jdk-8u231-linux-x64.tar.gz.* > jdk1.8.0_231.tar.gz

RUN tar -zxf jdk1.8.0_231.tar.gz

RUN chmod +x /minecraft/jdk1.8.0_231/bin/java

RUN ln -s /minecraft/jdk1.8.0_231/bin/java /usr/bin/

RUN java -jar forge-1.12.2-14.23.5.2768-installer.jar --installServer && rm forge-1.12.2-14.23.5.2768-installer.jar forge-1.12.2-14.23.5.2768-installer.jar.log

WORKDIR /minecraft/server

VOLUME /minecraft/server

EXPOSE 25565

CMD echo "eula=true" > eula.txt && java -Xms${Xms} -Xmx${Xmx} -jar ../forge-1.12.2-14.23.5.2768-universal.jar nogui