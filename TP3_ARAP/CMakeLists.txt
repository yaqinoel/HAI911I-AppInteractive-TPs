# ----------------------------------------------------------------------------
cmake_minimum_required(VERSION 3.22)

SET(CMAKE_EXPORT_COMPILE_COMMANDS 1)
SET(CMAKE_CXX_STANDARD 11)
SET(CMAKE_CXX_STANDARD_REQUIRED ON)

project(TP3_ARAP)

if(APPLE)
  enable_language(OBJC)
endif()

add_executable(
  TP3_ARAP
 	gmini.cpp
	src/Camera.h
	src/Camera.cpp
	src/LaplacianWeights.h
	src/linearSystem.h
	src/Mesh.h
	src/Mesh.cpp
	src/RectangleSelectionTool.h
	src/Scene.h
	src/Trackball.cpp
	src/Trackball.h
	src/Vec3.h)

add_subdirectory(extern/glad)
target_link_libraries(${PROJECT_NAME} PRIVATE glad)

set(GLFW_BUILD_DOCS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_TESTS OFF CACHE BOOL "" FORCE)
set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "" FORCE)
add_subdirectory(extern/glfw)
target_link_libraries(${PROJECT_NAME} PRIVATE glfw)


target_link_libraries(${PROJECT_NAME} PRIVATE ${CMAKE_DL_LIBS})

if(APPLE)
  target_compile_definitions(${PROJECT_NAME} PRIVATE EIGEN_DONT_VECTORIZE)
endif()

add_definitions(-w)

target_compile_definitions(TP3_ARAP PRIVATE
    MODELS_DIR="${CMAKE_CURRENT_SOURCE_DIR}/models"
)
