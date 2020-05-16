#!/usr/bin/env bash

#dir_my=defined in main build.sh file

printf "\n$(basename -- $BASH_SOURCE )\n\n"

dir_glfw_include="$dir_glfw/include"
dir_glfw_src="$dir_glfw/src"
dir_glfw_out_obj="$dir_my/out/obj"
dir_glfw_out_static="$dir_my/out/static"
mkdir -p "$dir_glfw_out_obj"
mkdir -p "$dir_glfw_out_static"
#
cmd_cc="/usr/bin/cc"
cc_options="-fPIC -Wall -std=gnu99 -Wdeclaration-after-statement"

#0
fn_build_glfw_obj () {
cd $dir_glfw_src
file_glfw_src="$1"
$cmd_cc -D_GLFW_USE_CONFIG_H -I$dir_glfw_include -I$dir_glfw_src $cc_options -o $dir_glfw_out_obj/$file_glfw_src.o -c $dir_glfw_src/$file_glfw_src
}

#1
fn_build_glfw_obj "context.c"
#2
fn_build_glfw_obj "init.c"
#3
fn_build_glfw_obj "input.c"
#4
fn_build_glfw_obj "monitor.c"
#5
fn_build_glfw_obj "vulkan.c"
#6
fn_build_glfw_obj "window.c"
#7
fn_build_glfw_obj "x11_init.c"
#8
fn_build_glfw_obj "x11_monitor.c"
#9
fn_build_glfw_obj "x11_window.c"
#10
fn_build_glfw_obj "xkb_unicode.c"
#11
fn_build_glfw_obj "posix_time.c"
#12
fn_build_glfw_obj "posix_thread.c"
#13
fn_build_glfw_obj "glx_context.c"
#14
fn_build_glfw_obj "egl_context.c"
#15
fn_build_glfw_obj "osmesa_context.c"
#16
fn_build_glfw_obj "linux_joystick.c"
#17
cd $dir_glfw_out_static
/usr/bin/ar qc libglfw3.a  $dir_glfw_out_obj/context.c.o $dir_glfw_out_obj/init.c.o $dir_glfw_out_obj/input.c.o $dir_glfw_out_obj/monitor.c.o $dir_glfw_out_obj/vulkan.c.o $dir_glfw_out_obj/window.c.o $dir_glfw_out_obj/x11_init.c.o $dir_glfw_out_obj/x11_monitor.c.o $dir_glfw_out_obj/x11_window.c.o $dir_glfw_out_obj/xkb_unicode.c.o $dir_glfw_out_obj/posix_time.c.o $dir_glfw_out_obj/posix_thread.c.o $dir_glfw_out_obj/glx_context.c.o $dir_glfw_out_obj/egl_context.c.o $dir_glfw_out_obj/osmesa_context.c.o $dir_glfw_out_obj/linux_joystick.c.o
/usr/bin/ranlib libglfw3.a

