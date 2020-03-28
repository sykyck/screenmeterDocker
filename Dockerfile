FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository multiverse && add-apt-repository universe 

# Install lots of packages
RUN apt-get update && apt-get install -y libxcb-keysyms1-dev libxcb-image0-dev \
    libxcb-shm0-dev libxcb-icccm4-dev libxcb-sync0-dev libxcb-xfixes0-dev \
    libxcb-shape0-dev libxcb-randr0-dev libxcb-render-util0-dev \
    libfontconfig1-dev libfreetype6-dev libx11-dev libxext-dev libxfixes-dev \
    libxi-dev libxrender-dev libxcb1-dev libx11-xcb-dev libxcb-glx0-dev x11vnc \
    xauth build-essential mesa-common-dev libglu1-mesa-dev libxkbcommon-dev \
    libxcb-xkb-dev libxslt1-dev libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev

RUN apt-get install -y build-essential libgl1-mesa-dev libfontconfig libdbus-glib-1-2 libfontconfig1 libxrender1 libxkbcommon-x11-0 libasound2

# Copy to home directory
COPY ./ScreenMeter_3.0.5_amd64.deb /home

#install using apt 
RUN apt-get update

RUN apt -y install /home/ScreenMeter_3.0.5_amd64.deb

#Run screenmeter
ENTRYPOINT screenmeter
