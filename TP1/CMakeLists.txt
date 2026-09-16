cmake_minimum_required(VERSION 3.22.0)
project(TP1_QT)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS
    Widgets
    OpenGL
    OpenGLWidgets
)

qt_standard_project_setup()

qt_add_executable(TP1_QT
    src/glwidget.cpp
    src/logo.cpp
    src/main.cpp
    src/mainwindow.cpp
    src/window.cpp
    src/maillage.cpp

    include/glwidget.h
    include/logo.h
    include/mainwindow.h
    include/window.h
    include/maillage.h
    include/OBJ_Loader.h

    shaders.qrc
)

target_include_directories(TP1_QT
    PUBLIC
        ${PROJECT_SOURCE_DIR}/include
)

target_link_libraries(TP1_QT
    PRIVATE
        Qt6::Widgets
        Qt6::OpenGL
        Qt6::OpenGLWidgets
)