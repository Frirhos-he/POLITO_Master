cmake_minimum_required(VERSION 3.24)
project(stack)

set(CMAKE_CXX_STANDARD 17)

add_executable(stack main.cpp StackClass.cpp QueueClass.h QueueClass.cpp GenericClass.h)
