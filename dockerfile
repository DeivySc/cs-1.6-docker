FROM debian:latest

RUN apt-get update && apt-get install -y wget lib32gcc1

# Download and set up HLDS
RUN mkdir /cs16 && \
    wget http://files.hldsupdatetool.com/hlupdate.gcf -O /cs16/steamcmd.tar.gz && \
    tar -xvzf /cs16/steamcmd.tar.gz -C /cs16

WORKDIR /cs16

CMD ["./hlds_run", "-game", "cstrike", "+maxplayers", "16", "+map", "de_dust2"]
