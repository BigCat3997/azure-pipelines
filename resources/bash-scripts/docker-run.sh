#!/bin/bash
# Purpose: Run Docker's image.
# --------------------------------------
docker run -p 8080:8080 -d ${DOCKER_SERVERURI}/${RELEASE_DOCKERIMAGENAME}:${RELEASE_DOCKERIMAGEVERSION}
