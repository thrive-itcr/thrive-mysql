#!/bin/bash
# Copyright (c) General Electric Company, 2019.  All rights reserved.

echo ""
echo "Removing mysql image."
docker rmi thriveitcr/thrive-mysql

echo ""
echo "Building mysql image."
docker build -t thriveitcr/thrive-mysql --build-arg http_proxy=$http_proxy --build-arg https_proxy=$https_proxy --build-arg no_proxy=$no_proxy .
echo ""
docker images
