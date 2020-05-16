#!/usr/bin/env bash

#dir_my=defined in main build.sh file

printf "\n$(basename -- $BASH_SOURCE )\n\n"

dir_glfw_include="$dir_glfw/include"
dir_glfw_examples_src="$dir_glfw/examples"
dir_glfw_examples_obj="$dir_my/out/glfw_examples/obj"
dir_glfw_examples_exe="$dir_my/out/glfw_examples/exe"
dir_glfw_src="$dir_glfw/src"
dir_glfw_out_obj="$dir_my/out/obj"
dir_glfw_out_static="$dir_my/out/static"
mkdir -p "$dir_glfw_examples_obj"
mkdir -p "$dir_glfw_examples_exe"
#
cmd_cc="/usr/bin/cc"

fn_build_glfw_tests () {
cd $dir_glfw_examples_src
file_src="$1"
deps="$2"
$cmd_cc -I"$dir_glfw/deps" -I"$dir_glfw/include" -std=gnu99 -o "$dir_glfw_examples_obj/$file_src.o" -c "$dir_glfw_examples_src/$file_src.c"
$cmd_cc -rdynamic "$dir_glfw_examples_obj/$file_src.o" $deps -o "$dir_glfw_examples_exe/$file_src" "$dir_glfw_out_static/libglfw3.a" -lm -lrt -lm -ldl -lX11 -lpthread 
}

#build deps
#source "$dir_my/build_scripts/glfw.deps.linux64.sh"
#end bulding deps

#1
fn_build_glfw_tests "boing" "$dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "gears" "$dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "heightmap" "$dir_deps_obj/glad_gl.c.o"  
fn_build_glfw_tests "offscreen" "$dir_deps_obj/glad_gl.c.o" 
fn_build_glfw_tests "particles" "$dir_deps_obj/glad_gl.c.o $dir_deps_obj/tinycthread.c.o"   
fn_build_glfw_tests "sharing" "$dir_deps_obj/glad_gl.c.o"   
fn_build_glfw_tests "simple" "$dir_deps_obj/glad_gl.c.o"           
