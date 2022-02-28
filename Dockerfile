FROM debian:buster-slim
WORKDIR /root

# Install Dependencies
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y --no-install-recommends\
 curl\
 gnupg2\
 software-properties-common

# Install Wine
RUN curl https://dl.winehq.org/wine-builds/winehq.key | apt-key add - &&\
  apt-add-repository https://dl.winehq.org/wine-builds/debian/ &&\
  apt-add-repository non-free &&\
  apt-get update
RUN curl -L https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10/i386/libfaudio0_20.01-0~buster_i386.deb > libfaudio0_20.01-0~buster_i386.deb &&\
  curl -L https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_10/amd64/libfaudio0_20.01-0~buster_amd64.deb > libfaudio0_20.01-0~buster_amd64.deb &&\
  dpkg -i --force-depends libfaudio0_20.01-0~buster_i386.deb &&\
  dpkg -i --force-depends libfaudio0_20.01-0~buster_amd64.deb
RUN apt-get install -f -y &&\
  apt-get install --install-recommends winehq-stable -y &&\
  rm *.deb

# Install Steamcmd
RUN echo steam steam/question select "I AGREE" | debconf-set-selections && apt-get update && apt-get install -y --no-install-recommends\
 steamcmd

RUN ln -s /usr/games/steamcmd /steamcmd

# Cleanup
RUN apt-get purge software-properties-common gnupg2 python* -y &&\
  apt-get autoclean &&\
  apt-get autoremove -y