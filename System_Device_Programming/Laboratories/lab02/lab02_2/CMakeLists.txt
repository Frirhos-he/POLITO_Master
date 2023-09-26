cmake_minimum_required(VERSION 3.24)
project(lab02_2 C)

set(CMAKE_C_STANDARD 11)

add_executable(lab02_2 main.c)

set(THREADS_PREFER_PTHREAD_FLAG ON)
find_package(Threads REQUIRED)
target_link_libraries(lab02_2 Threads::Threads)