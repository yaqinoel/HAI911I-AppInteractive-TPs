# HAI911I Application Interactive

Repository for the practical assignments of the HAI911I Application Interactive course.

## Structure

- `TP1/` - Introduction to Qt OpenGL: signals and slots, indexed mesh rendering, and OBJ loading.
- `TP2/`, `TP3/`, ... - Future practical assignments, each kept self-contained.

## Running a practical assignment

Open the repository-level `CMakeLists.txt` in CLion. Select the required target
from the run-target menu, for example `TP1_QT` for TP1.

From a terminal:

```bash
cmake -S . -B build
cmake --build build --target TP1_QT
```
