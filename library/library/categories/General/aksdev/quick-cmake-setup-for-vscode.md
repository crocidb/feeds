+++
title = "Quick CMake setup for VSCode"
description = "When setting up my ScifiFPS C/Raylib project, I was having lots of problems with Makefiles. Apparently this is not uncommon, however I'm pretty new in C and makefiles in the first place, and setting it all"
date = "2021-05-29T00:00:00Z"
url = "https://akselmo.dev/posts/quick-cmake-setup/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:57.168371411Z"
seen = true
+++

When setting up my [ScifiFPS](https://github.com/Akselmo/Artificial-Rage) C/[Raylib](https://www.raylib.com/) project, I was having lots of problems with Makefiles. Apparently this is not uncommon, however I'm pretty new in C and makefiles in the first place, *and* setting it all up with VSCode was also a bit of a hassle.

I however managed to get my CMake files work nicely with VSCode. Keep in mind this **has only been tested on Windows**, because as much as I'd love to run Linux as my daily driver, I haven't had the chance to do the switch yet. Also this was made for **Raylib** project, so you probaby will have to modify your build command etc. to suit your needs.

**If you just want to get VSCode to build your project using CMake Tools when you press F5, skip to section 4!**

#### [Here's how I got VSCode build my Raylib C project with CMake on Windows:](#here-s-how-i-got-vscode-build-my-raylib-c-project-with-cmake-on-windows) ####

1. First, download [CMake Tools -extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cmake-tools) for your VSCode. You'll also have to install [CMake](https://cmake.org/)

2. In the root of your C project folder, add `CMakeLists.txt` and copy the following to the file

   ```
   cmake_minimum_required(VERSION 3.0)
   project(scififps C)

   set(CMAKE_C_STANDARD 99)

   add_subdirectory(src)

   add_executable(${PROJECT_NAME} ${SOURCE_CODE})
   #Currently compiles only for Windows.
   IF (WIN32)
       #ADD YOUR WINDOWS COMPILE COMMAND HERE
       #I used following for Raylib.
       target_link_libraries(${PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/lib/libraylib.a opengl32 gdi32 winmm)
   ELSE()
       #Here goes other platforms. You can make your own for Linux and such.
   ENDIF()

   target_compile_definitions(${PROJECT_NAME} PUBLIC ASSETS_PATH="${CMAKE_CURRENT_SOURCE_DIR}/assets/")

   ```

   And yes, I know I could have built the libraylib.a straight from source, but I didn't want to build libraylib.a every time I build the game.

3. Put this in your `src` directory inside `CMakeLists.txt` file

   ```
   file (GLOB_RECURSE SOURCE_CODE *.h *.c)
   set (SOURCE_CODE "${SOURCE_CODE}" PARENT_SCOPE)

   ```

   This will fetch all the \*.h and \*.c files and link them to source code, so you don't have to type them all. Thanks to [GoldenThumbs](https://github.com/GoldenThumbs/raylibGame/blob/main/src/CMakeLists.txt) for showing me this!

4. To get VSCode build your project when you press F5, add the following to your project root inside `.vscode` folder.

   `launch.json`

   ```
   {
       "version": "0.2.0",
       "configurations": [
           {
               "name": "Run target",
               "type": "cppdbg",
               "request": "launch",
               "preLaunchTask": "build",
               "program": "${command:cmake.launchTargetPath}",
               "cwd": "${workspaceFolder}/build"
           }
       ]
   }

   ```

   `tasks.json`

   ```
   {
       "version": "2.0.0",
       "tasks": [
           {
               "label": "build",
               "type": "shell",
               "command": "{cmake.debugTarget}",
               "options": {
                   "cwd": "${workspaceFolder}/build"
               },
               "group": {
                   "kind": "build",
                   "isDefault": true
               }
           },
       ]
   }

   ```

   Now every time you press F5, VScode uses the Cmake extension to build and debug your project.

### [That should be it!](#that-should-be-it) ###

Again, remember that the first `CMakeLists.txt` file I mentioned, the one that goes to the root of your project, you may have to tailor for your own needs. The one I copied there works for me when I build Raylib projects.

Also, **I'm new in all of things related to C!** If you have better ideas how to make CMake files, don't hesitate to contact me on my [twitter](https://www.twitter.com/akselmo) or if you spot me in Discord. I'd like to know and learn.

However I hope this is useful someone! Happy coding, and happy less-make-file..ing. *That sounded better in my head..*