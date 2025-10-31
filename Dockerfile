# Usa OpenJDK 21 oficial (64 bits)
FROM eclipse-temurin:21-jdk

# Define pasta de trabalho
WORKDIR /minecraft

# Copia todos os arquivos da pasta atual para o container
COPY . .

# Cria pasta de dados e define EULA
RUN mkdir -p /minecraft/data && \
    echo "eula=true" > /minecraft/data/eula.txt

# Define volume para persistência
VOLUME /minecraft/data

# Expõe as portas padrão do Minecraft (Java e Bedrock)
EXPOSE 25565 19132

# Comando para iniciar o servidor
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "paper-1.21.8-60.jar", "nogui"]
