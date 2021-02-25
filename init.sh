#!/bin/bash
sudo docker network create -d bridge allthingstalk-network

sudo docker build -t server1 server1/
sudo docker build -t server2 server2/
sudo docker build -t server3 server3/
sudo docker build -t server_loadbalancer server_loadbalancer/

sudo docker run --network=allthingstalk-network -d -v ${PWD}/logs:/var/log/nginx --name dnsserver1 server1
sudo docker run --network=allthingstalk-network -d -v ${PWD}/logs:/var/log/nginx --name dnsserver2 server2
sudo docker run --network=allthingstalk-network -d -v ${PWD}/logs:/var/log/nginx --name dnsserver3 server3
sudo docker run --network=allthingstalk-network -d -p 80:80 -v ${PWD}/logs:/var/log/nginx server_loadbalancer
