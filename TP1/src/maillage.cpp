#include <maillage.h>
#include <QVector3D>

#include "OBJ_Loader.h"

Maillage::Maillage() {

}

void Maillage::initialCube() {
    const GLfloat hw = 0.5f;
    m_vertices = {
        // avant
        {-hw, -hw,  hw,  0,  0,  1},
        { hw, -hw,  hw,  0,  0,  1},
        { hw,  hw,  hw,  0,  0,  1},
        {-hw,  hw,  hw,  0,  0,  1},

        // arrière
        { hw, -hw, -hw,  0,  0, -1},
        {-hw, -hw, -hw,  0,  0, -1},
        {-hw,  hw, -hw,  0,  0, -1},
        { hw,  hw, -hw,  0,  0, -1},

        // gauche
        {-hw, -hw, -hw, -1,  0,  0},
        {-hw, -hw,  hw, -1,  0,  0},
        {-hw,  hw,  hw, -1,  0,  0},
        {-hw,  hw, -hw, -1,  0,  0},

        // droite
        { hw, -hw,  hw,  1,  0,  0},
        { hw, -hw, -hw,  1,  0,  0},
        { hw,  hw, -hw,  1,  0,  0},
        { hw,  hw,  hw,  1,  0,  0},

        // haute
        {-hw,  hw,  hw,  0,  1,  0},
        { hw,  hw,  hw,  0,  1,  0},
        { hw,  hw, -hw,  0,  1,  0},
        {-hw,  hw, -hw,  0,  1,  0},

        // basse
        {-hw, -hw, -hw,  0, -1,  0},
        { hw, -hw, -hw,  0, -1,  0},
        { hw, -hw,  hw,  0, -1,  0},
        {-hw, -hw,  hw,  0, -1,  0}
    };

    m_indices = {
        0,  1,  2,
        2,  3,  0,
        4,  5,  6,
        6,  7,  4,
        8,  9, 10,
        10, 11,  8,
        12, 13, 14,
        14, 15, 12,
        16, 17, 18,
        18, 19, 16,
        20, 21, 22,
        22, 23, 20
   };
}

void Maillage::loadMaillage(const std::filesystem::path& path) {
    objl::Loader loader;
    if (!loader.LoadFile(path.string())) {
        throw:: std::runtime_error("Failed to load OBJ file");
    }

    m_vertices.clear();
    m_indices.clear();

    m_vertices.reserve(static_cast<qsizetype>(loader.LoadedVertices.size()));
    m_indices.reserve(static_cast<qsizetype>(loader.LoadedIndices.size()));

    // Vertices
    for (const auto& vertex : loader.LoadedVertices) {
        Vertex v {
            static_cast<GLfloat>(vertex.Position.X),
            static_cast<GLfloat>(vertex.Position.Y),
            static_cast<GLfloat>(vertex.Position.Z),

            static_cast<GLfloat>(vertex.Normal.X),
            static_cast<GLfloat>(vertex.Normal.Y),
            static_cast<GLfloat>(vertex.Normal.Z)
        };
        m_vertices.push_back(v);
    }

    // Indices
    for (unsigned int index : loader.LoadedIndices) {
        m_indices.push_back(
            static_cast<GLuint>(index)
        );
    }

    computeNormals();
}

void Maillage::upload() {
    m_vao.create();
    m_vbo.create();
    m_ebo.create();

    m_vao.bind();
    m_vbo.bind();

    m_vbo.allocate(m_vertices.constData(),m_vertices.size() * sizeof(Vertex));

    m_ebo.bind();
    m_ebo.allocate(m_indices.constData(),m_indices.size() * sizeof(GLuint));

    m_vao.release();
    m_vbo.release();
}

void Maillage::bind() {
    m_vao.bind();
    m_vbo.bind();
}

void Maillage::release() {
    m_vao.release();
    m_vbo.release();
}

void Maillage::destroy()
{
    m_vbo.destroy();
    m_ebo.destroy();
    m_vao.destroy();
}

int Maillage::indexCount() const {
    return m_indices.size();
}

void Maillage::computeNormals() {
    for (Vertex &v : m_vertices) {
        v.nx = 0.0f;
        v.ny = 0.0f;
        v.nz = 0.0f;
    }

    for (qsizetype i = 0; i + 2 < m_indices.size(); i += 3) {
        GLuint i0 = m_indices[i];
        GLuint i1 = m_indices[i + 1];
        GLuint i2 = m_indices[i + 2];

        Vertex &v0 = m_vertices[i0];
        Vertex &v1 = m_vertices[i1];
        Vertex &v2 = m_vertices[i2];

        QVector3D p0(v0.x, v0.y, v0.z);
        QVector3D p1(v1.x, v1.y, v1.z);
        QVector3D p2(v2.x, v2.y, v2.z);

        QVector3D e1 = p1 - p0;
        QVector3D e2 = p2 - p0;

        QVector3D normal = QVector3D::crossProduct(e1, e2);

        if (normal.lengthSquared() == 0.0f)
            continue;

        v0.nx += normal.x();
        v0.ny += normal.y();
        v0.nz += normal.z();

        v1.nx += normal.x();
        v1.ny += normal.y();
        v1.nz += normal.z();

        v2.nx += normal.x();
        v2.ny += normal.y();
        v2.nz += normal.z();
    }

    for (Vertex &v : m_vertices) {
        QVector3D normal(v.nx, v.ny, v.nz);
        if (!normal.isNull()) {
            normal.normalize();
            v.nx = normal.x();
            v.ny = normal.y();
            v.nz = normal.z();
        }
    }
}
