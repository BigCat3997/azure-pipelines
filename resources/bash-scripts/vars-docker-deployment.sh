#!/bin/bash
# Purpose: Transfer content of metadata.json file into variables.
# --------------------------------------
GIT_COMMIT_ID=$(jq -r .gitCommitId $1)
GIT_SHORT_COMMIT_ID=$(jq -r .gitShortCommitId $1)
PIPELINE_NAME=$(jq -r .pipelineName $1)
BUILD_NUMBER=$(jq -r .buildNumber $1)
DOCKER_IMAGE_NAME=$(jq -r .dockerImageName $1)
DOCKER_IMAGE_VERSION=$(jq -r .dockerImageVersion $1)

echo ${GIT_COMMIT_ID}
echo ${GIT_SHORT_COMMIT_ID}
echo ${PIPELINE_NAME}
echo ${BUILD_NUMBER}
echo ${DOCKER_IMAGE_NAME}
echo ${DOCKER_IMAGE_VERSION}

echo "##vso[task.setvariable variable=Release.GitCommitId]${GIT_COMMIT_ID}"
echo "##vso[task.setvariable variable=Release.GitShortCommitId]${GIT_SHORT_COMMIT_ID}"
echo "##vso[task.setvariable variable=Release.PipelineName]${PIPELINE_NAME}"
echo "##vso[task.setvariable variable=Release.BuildNumber]${BUILD_NUMBER}"
echo "##vso[task.setvariable variable=Release.DockerImageName]${DOCKER_IMAGE_NAME}"
echo "##vso[task.setvariable variable=Release.DockerImageVersion]${DOCKER_IMAGE_VERSION}"
