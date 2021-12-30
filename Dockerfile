#Let's build first the server
FROM debian:latest AS builder
RUN apt-get update
RUN apt-get -y install make
RUN apt-get -y install git
RUN apt-get -y install gcc
RUN apt-get -y install libsdl2-dev
RUN git clone https://github.com/ioquake/ioq3
RUN make BUILD_SERVER=1 BUILD_CLIENT=0 --directory ioq3/
COPY pk/* ioq3/build/release-linux-x86_64/baseq3

#Creating the img to be used 
FROM debian:bookworm-slim
WORKDIR /app
COPY --from=builder ioq3/build/release-linux-x86_64/ ./
COPY server.cfg ./baseq3/scripts/hack.factories
COPY q3config_server.cfg ./baseq3/q3config_server.cfg

CMD ["./ioq3ded.x86_64", "+map", "q3dm17", "+exec", "scripts/hack.factories"]

EXPOSE 27960/udp