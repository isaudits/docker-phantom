#!/bin/bash

#docker pull metasploitframework/metasploit-framework:latest
docker build -t isaudits/phantom .
docker image prune -f