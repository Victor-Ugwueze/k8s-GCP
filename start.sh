#!/bin/bash
sudo rm -rf package-lock.json

sudo git pull

sudo npm i

pm2 restart index.js

