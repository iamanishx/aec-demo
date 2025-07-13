cmake_minimum_required(VERSION 3.15)
project(AEC_Demo)


add_executable(aec_demo main.cpp)

include_directories(C:/Users/manis/aec_demo/vcpkg/installed/x64-windows/include)

link_directories(C:/Users/manis/aec_demo/vcpkg/installed/x64-windows/lib)

target_link_libraries(aec_demo PRIVATE 
    "C:/Users/manis/aec_demo/vcpkg/installed/x64-windows/lib/portaudio.lib"
    "C:/Users/manis/aec_demo/vcpkg/installed/x64-windows/lib/speexdsp.lib"
)