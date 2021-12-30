# IOQuake3 Server Docker Image
Easy way to get your own quake 3 server running either in your LAN or on the Internet. 

### Building the image

First we've to get the pk3 files from the Internet, or if you've them from the original cd or game.

```sh
sh get_pk3.sh 
docker build -t ioq3-server .
```

### Running the Docker Image

```sh
docker run -p 27960:27960/udp ioq3-server
```

If you want to edit the server or the game options check the cfg files.