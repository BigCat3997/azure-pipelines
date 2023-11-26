#!/bin/bash
# Purpose: Login in private Docker hub.
# --------------------------------------
docker pull ${DOCKER_SERVERURI}/${RELEASE_DOCKERIMAGENAME}:${RELEASE_DOCKERIMAGEVERSION}
