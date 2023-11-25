#!/bin/bash
# Purpose: Login in private Docker hub.
# --------------------------------------
docker login ${DOCKER_SERVERURI} -u ${DOCKER_SERVERUSERNAME} -p ${DOCKER_SERVERPASSWORD}