#!/bin/sh
echo "Installing Docker.."
echo "- curl -fsSL https://get.docker.com | sudo bash"
curl -fsSL https://get.docker.com | sudo bash
echo "Pulling Image.."
echo "- docker pull adolfintel/speedtest"
docker pull adolfintel/speedtest
echo "Running container.."
echo "- docker run -d -p 8080:80 adolfintel/speedtest:latest"
docker run -d -p 8080:80 adofintel/speedtest:latest
echo "Done."
echo "Visit http://[SERVER_IP]:8080 please."
