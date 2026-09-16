#pragma once

#include <filesystem>
#include <qopengl.h>
#include <QOpenGLBuffer>
#include <QOpenGLVertexArrayObject>
#include <QVector>

struct Vertex {
    GLfloat x, y, z;
    GLfloat nx, ny, nz;
};

class Maillage {

public:
    Maillage();
    void initialCube();
    void loadMaillage(const std::filesystem::path& path);
    void upload();
    void bind();
    void release();
    void destroy();
    int indexCount() const;

private:
    void computeNormals();
    QOpenGLVertexArrayObject m_vao;
    QOpenGLBuffer m_vbo{QOpenGLBuffer::VertexBuffer};
    QOpenGLBuffer m_ebo{QOpenGLBuffer::IndexBuffer};

    QVector<Vertex> m_vertices;
    QVector<GLuint> m_indices;
};
