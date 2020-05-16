#!/usr/bin/env bash


#dir_my=defined in main build.sh file

printf "\n$(basename -- $BASH_SOURCE )\n\n"

dir_deps_obj="$dir_my/out/glfw_deps_obj"
mkdir -p "$dir_deps_obj"
#
cmd_cc="/usr/bin/cc"

#0
fn_build_glfw_deps () {
file_src="$1"
$cmd_cc -I"$dir_glfw/deps" -I"$dir_glfw/include" -std=gnu99 -o "$dir_deps_obj/$file_src.o" -c "$dir_glfw/deps/$file_src"
}

#build deps
fn_build_glfw_deps "getopt.c"
fn_build_glfw_deps "glad_gl.c"
fn_build_glfw_deps "tinycthread.c"
fn_build_glfw_deps "glad_vulkan.c"
#end bulding deps
