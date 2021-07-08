#!/bin/bash

mv /home/ubuntu/helm /usr/local/bin/
export PATH=/usr/local/bin/:$PATH
helm install phpmyadm ./*.tgz
