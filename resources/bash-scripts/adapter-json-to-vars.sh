#!/bin/bash
# Purpose: Transfer content of json file into variables.
# This script run into Azure environment where all variables is not stored normally.
# We must use its own syntax (task.setvariable) to expose these variables.
# Reference link: https://learn.microsoft.com/en-us/azure/devops/pipelines/process/variables?view=azure-devops&tabs=yaml%2Cbatch
# Json payload:
# {
#     "fruit": "Apple",
#     "size": "Large",
#     "color": "Red"
# }
# --------------------------------------
echo "Json file path: ${JSON_FILE_PATH}"

printf %.1s ={1..50} $'\n'
echo 'List of variables will be exported.'
printf %.1s ={1..50} $'\n'

# export variables commonly.
vars=$(cat ${JSON_FILE_PATH} | jq -r 'to_entries|map("\(.key|ascii_upcase)=\(.value|tostring)")|.[]')
printf "%s\n" ${vars}

# export variables by Azure environment.
vars_azure=$(cat ${JSON_FILE_PATH} | jq -r 'to_entries|map("echo \"##vso[task.setvariable variable=\(.key|ascii_upcase)]\(.value|tostring)\"")| .[]')
eval "${vars_azure}"
