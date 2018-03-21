# docker-traderworkstation-novnc
Docker Container for Interactive Brokers Trader Workstation running under ubuntu with novnc access

Leverages docker container dorowu/ubuntu-desktop-lxde-vnc
  Docker - https://hub.docker.com/r/dorowu/ubuntu-desktop-lxde-vnc
  Github - https://github.com/fcwu/docker-ubuntu-vnc-desktop

Start the container using 

docker run -d --name tws -p 6080:80 -p 5900:5900 -e PASSWORD=twspassword -e VNC_PASSWORD=vncpassword samsaeed/trader-workstation

for complete list of command line options check the source repositories above
