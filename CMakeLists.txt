cmake_minimum_required(VERSION 3.10)
project(OS C)

set(CMAKE_C_STANDARD 99)

add_executable(server server.c local_library.h)
add_executable(client client.c local_library.h)
add_executable(testf test.c)