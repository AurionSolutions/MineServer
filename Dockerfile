# Usa OpenJDK 21 oficial (64 bits)
FROM eclipse-temurin:21-jdk

# Evita rodar como root
RUN useradd -m -r -d /home/minecraft -s /sbin/nologin minecraft

# Define pasta de trabalho
WORKDIR /minecraft

# Copia todos os arquivos da pasta atual para o container
COPY . .

# Cria pasta de dados e define EULA (será persistida no volume)
RUN mkdir -p /minecraft/data && \
    echo "eula=true" > /minecraft/data/eula.txt && \
    chown -R minecraft:minecraft /minecraft

# Define volume para persistência (mapeie no docker run)
VOLUME ["/minecraft/data"]

# Expõe as portas (indica TCP/UDP corretamente)
EXPOSE 25565/tcp
EXPOSE 25565/udp
EXPOSE 19132/tcp
EXPOSE 19132/udp

# Muda para usuário não-root
USER minecraft

# Comando para iniciar o servidor (ajuste -Xmx/-Xms conforme memória do host)
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "paper-1.21.8-60.jar", "nogui"]
