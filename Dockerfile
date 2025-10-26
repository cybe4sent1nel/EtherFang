#EtherFang Dockerfile

#Base image
FROM kalilinux/kali-rolling:latest

#Credits & Data
LABEL \
	name="EtherFang" \
	author="cybe4sent1nel<fahadkhanxyz8816@gmail.com>" \
	maintainer="cybe4sent1nel<fahad.64@gmail.com>" \
	description="This is a multi-use bash script for Linux systems to audit wireless networks."

#Env vars
ENV ETHERFANG_URL="https://github.com/cybe4sent1nel/EtherFang.git"
ENV HASHCAT2_URL="https://github.com/hashcat/hashcat.git"
ENV DEBIAN_FRONTEND="noninteractive"

#Update system
RUN apt update

#Set locales
RUN \
	apt -y install \
	locales && \
	locale-gen en_US.UTF-8 && \
	sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
	echo 'LANG="en_US.UTF-8"' > /etc/default/locale && \
	dpkg-reconfigure --frontend=noninteractive locales && \
	update-locale LANG=en_US.UTF-8

#Env vars for locales
ENV LANG="en_US.UTF-8"
ENV LANGUAGE="en_US:en"
ENV LC_ALL="en_US.UTF-8"

#Install EtherFang essential tools
RUN \
	apt -y install \
	gawk \
	iw \
	aircrack-ng \
	xterm \
	iproute2 \
	pciutils \
	procps \
	tmux

#Install EtherFang internal tools
RUN \
	apt -y install \
	ethtool \
	usbutils \
	rfkill \
	x11-utils \
	wget \
	ccze \
	systemd \
	x11-xserver-utils \
	arping

#Install update tools
RUN \
	apt -y install \
	curl \
	git

#Install EtherFang optional tools
RUN \
	apt -y install \
	crunch \
	hashcat \
	mdk3 \
	mdk4 \
	hostapd \
	lighttpd \
	iptables \
	nftables \
	ettercap-text-only \
	bettercap \
	isc-dhcp-server \
	dnsmasq \
	reaver \
	bully \
	pixiewps \
	hostapd-wpe \
	asleap \
	john \
	openssl \
	hcxtools \
	hcxdumptool \
	beef-xss \
	tshark \
	tcpdump

#Env var for display
ENV DISPLAY=":0"

#Create volume dir for external files
RUN mkdir /io
VOLUME /io

#Set workdir
WORKDIR /opt/

#EtherFang install method 1 (only one method can be used, other must be commented)
#Install EtherFang (Docker Hub automated build process)
RUN mkdir EtherFang
COPY . /opt/EtherFang

#EtherFang install method 2 (only one method can be used, other must be commented)
#Install EtherFang (manual image build)
#Uncomment git clone line and one of the ENV vars to select branch (master->latest, dev->beta)
#ENV BRANCH="master"
#ENV BRANCH="dev"
#RUN git clone -b ${BRANCH} ${ETHERFANG_URL}

#Remove auto update
RUN sed -i 's|ETHERFANG_AUTO_UPDATE=true|ETHERFANG_AUTO_UPDATE=false|' EtherFang/.EtherFangrc

#Force use of iptables
RUN sed -i 's|ETHERFANG_FORCE_IPTABLES=false|ETHERFANG_FORCE_IPTABLES=true|' EtherFang/.EtherFangrc

#Make bash script files executable
RUN chmod +x EtherFang/*.sh

#Downgrade Hashcat
RUN \
	git clone ${HASHCAT2_URL} && \
	cp /opt/hashcat2.0/hashcat /usr/bin/ && \
	chmod +x /usr/bin/hashcat

#Clean packages
RUN \
	apt clean && \
	apt autoclean && \
	apt autoremove -y

#Clean files
RUN \
	rm -rf /opt/EtherFang/imgs > /dev/null 2>&1 && \
	rm -rf /opt/EtherFang/.github > /dev/null 2>&1 && \
	rm -rf /opt/EtherFang/.editorconfig > /dev/null 2>&1 && \
	rm -rf /opt/EtherFang/CONTRIBUTING.md > /dev/null 2>&1 && \
	rm -rf /opt/EtherFang/CODE_OF_CONDUCT.md > /dev/null 2>&1 && \
	rm -rf /opt/EtherFang/pindb_checksum.txt > /dev/null 2>&1 && \
	rm -rf /opt/EtherFang/Dockerfile > /dev/null 2>&1 && \
	rm -rf /opt/EtherFang/binaries > /dev/null 2>&1 && \
	rm -rf /opt/hashcat2.0 > /dev/null 2>&1 && \
	rm -rf /opt/EtherFang/plugins/* > /dev/null 2>&1 && \
	rm -rf /tmp/* > /dev/null 2>&1 && \
	rm -rf /var/lib/apt/lists/* > /dev/null 2>&1

#Expose BeEF control panel port
EXPOSE 3000

#Create volume for plugins
VOLUME /opt/EtherFang/plugins

#Start command (launching EtherFang)
CMD ["/bin/bash", "-c", "/opt/EtherFang/EtherFang.sh"]
