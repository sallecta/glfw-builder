#!/usr/bin/env bash

#dir_my=defined in main build.sh file

printf "\n$(basename -- $BASH_SOURCE )\n\n"

dir_glfw_include="$dir_glfw/include"
dir_glfw_tests_src="$dir_glfw/tests"
dir_glfw_tests_obj="$dir_my/out/glfw_tests/obj"
dir_glfw_tests_exe="$dir_my/out/glfw_tests/exe"
dir_glfw_src="$dir_glfw/src"
dir_glfw_out_obj="$dir_my/out/obj"
dir_glfw_out_static="$dir_my/out/static"
mkdir -p "$dir_glfw_tests_obj"
mkdir -p "$dir_glfw_tests_exe"
#
cmd_cc="/usr/bin/cc"

fn_build_glfw_tests () {
cd $dir_glfw_tests_src
file_src="$1"
deps="$2"
$cmd_cc -I"$dir_glfw/deps" -I"$dir_glfw/include" -std=gnu99 -o "$dir_glfw_tests_obj/$file_src.o" -c "$dir_glfw_tests_src/$file_src.c"
$cmd_cc -rdynamic "$dir_glfw_tests_obj/$file_src.o" $deps -o "$dir_glfw_tests_exe/$file_src" "$dir_glfw_out_static/libglfw3.a" -lm -lrt -lm -ldl -lX11 -lpthread 
}

#build deps
#source "$dir_my/build_scripts/glfw.deps.linux64.sh"
#end bulding deps

#1
fn_build_glfw_tests "clipboard" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"  
fn_build_glfw_tests "cursor" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"  
fn_build_glfw_tests "empty" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o $dir_deps_obj/tinycthread.c.o" 
fn_build_glfw_tests "events" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"  
fn_build_glfw_tests "gamma" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"   
fn_build_glfw_tests "glfwinfo" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o $dir_deps_obj/glad_vulkan.c.o"  
fn_build_glfw_tests "icon" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "iconify" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "inputlag" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "joysticks" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "monitors" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "msaa" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "opacity" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "reopen" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "tearing" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "threads" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o $dir_deps_obj/tinycthread.c.o"
fn_build_glfw_tests "timeout" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "title" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
fn_build_glfw_tests "triangle-vulkan" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o $dir_deps_obj/glad_vulkan.c.o"
fn_build_glfw_tests "windows" "$dir_deps_obj/getopt.c.o $dir_deps_obj/glad_gl.c.o"
