# Usa OpenJDK 21 oficial (64 bits)
FROM eclipse-temurin:21-jdk

# Define pasta de trabalho
WORKDIR /minecraft

# Copia todos os arquivos da pasta atual
COPY . .

# Cria pasta de dados e define permissões
RUN mkdir -p /minecraft/data && \
    echo "eula=true" > /minecraft/data/eula.txt

# Define volume para persistência
VOLUME /minecraft/data

# Expõe a porta do Minecraft
EXPOSE 25565
EXPOSE 19132

# Inicia o servidor
CMD ["java", "-Xmx4G", "-Xms4G", "-jar", "paper-1.21.8-60.jar", "nogui"]
