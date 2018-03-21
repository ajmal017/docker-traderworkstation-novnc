FROM dorowu/ubuntu-desktop-lxde-vnc

ENV USER tws
ENV TZ=America/New_York
WORKDIR /home/$USER
ADD . /home/$USER

RUN \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone && \
    groupadd -r $USER && \
    useradd --no-log-init -r -g $USER $USER && \
    curl -o /home/$USER/tws-latest-linux-x64.sh https://download2.interactivebrokers.com/installers/tws/latest/tws-latest-linux-x64.sh && \
    chmod u+x /home/$USER/tws-latest-linux-x64.sh && \
    mkdir /home/$USER/Desktop && \
    mkdir /home/$USER/.config && \
    mkdir /home/$USER/.config/autostart && \
    chown -R $USER:$USER /home/$USER

USER $USER
RUN \
    echo "n" |/home/$USER/tws-latest-linux-x64.sh && \
    cp /home/$USER/Desktop/*.desktop /home/$USER/.config/autostart
USER root
