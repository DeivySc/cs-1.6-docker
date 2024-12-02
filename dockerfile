FROM debian:latest

# Instalar dependencias necesarias
RUN apt-get update && apt-get install -y wget lib32gcc1

# Crear directorio para el servidor
RUN mkdir /cs16

# Descargar y extraer SteamCMD
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz -O /cs16/steamcmd.tar.gz && \
    tar -xvzf /cs16/steamcmd.tar.gz -C /cs16

WORKDIR /cs16

# Descargar e instalar HLDS para Counter-Strike 1.6
RUN ./steamcmd.sh +login anonymous +force_install_dir /cs16 +app_update 90 validate +quit

# Configuración de inicio del servidor
CMD ["./hlds_run", "-game", "cstrike", "+maxplayers", "16", "+map", "de_dust2"]
