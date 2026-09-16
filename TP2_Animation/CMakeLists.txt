cmake_minimum_required(VERSION 3.22.0)
project(TP2_Animation)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)
find_package(GSL REQUIRED)
find_package(Threads REQUIRED)

add_executable(TP2_Animation
    src/Camera.cpp
    src/Mesh.cpp
    src/Trackball.cpp
    src/main.cpp
)

target_include_directories(TP2_Animation
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/include
)

target_link_libraries(TP2_Animation
    PRIVATE
        OpenGL::GL
        OpenGL::GLU
        GLUT::GLUT
        GSL::gsl
        GSL::gslcblas
        Threads::Threads
)

target_compile_definitions(TP2_Animation PRIVATE
    MODELS_DIR="${CMAKE_CURRENT_SOURCE_DIR}/models"
)
