#!/usr/bin/env bash


#dir_my=defined in 0_global_vars.sh file

printf "\n$(basename -- $BASH_SOURCE )\n\n"

cp "$dir_my/config/glfw_config.h" "$dir_glfw/src"
