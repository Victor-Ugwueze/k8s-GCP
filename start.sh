#!/bin/bash
sudo rm -rf package-lock.json

sudo git pull

sudo npm i

pm3 start index.js
