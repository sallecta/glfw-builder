#!/usr/bin/env bash


# global variables
dir_my="$PWD"
dir_glfw="$dir_my/glfw"
# end global variables

source "$dir_my/build_scripts/glfw.config.linux64.sh"
source "$dir_my/build_scripts/glfw.static.linux64.sh"
source "$dir_my/build_scripts/glfw.deps.linux64.sh"
source "$dir_my/build_scripts/glfw.tests.linux64.sh"
source "$dir_my/build_scripts/glfw.examples.linux64.sh"

