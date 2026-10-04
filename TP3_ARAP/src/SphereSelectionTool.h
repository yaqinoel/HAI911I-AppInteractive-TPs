#ifndef SphereSelectionTool_H
#define SphereSelectionTool_H
#include "OpenGL.h"
#include "Vec3.h"

void drawSphere(
	float x, float y, float z,
	float radius, int slices, int stacks
);

struct SphereSelectionTool
{
	float radius;
	Vec3 center;
	bool isAdding;
	bool isActive;

	SphereSelectionTool() : radius(1.0), center(0.0, 0.0, 0.0), isAdding(false), isActive(false) {}


	void initSphere(const Vec3& pCenter, const float &pRadius)
	{
		// init sphere with Vec3 center and radius
		center = pCenter;
		radius = pRadius;
	}

	void updateSphere(float pRadius)
	{
		// update radius
		if (pRadius < 0)
			return;
		radius = pRadius;
	}

	bool contains (const Vec3& p)
	{
		// is point p in sphere (center_x, center_y, center_z), radius) ?
		return (p - center).squareLength() <= radius * radius;
	}


	void draw() {
		if (!isActive || radius <= 0.0f) return;

		glPushAttrib(GL_ENABLE_BIT | GL_CURRENT_BIT | GL_LINE_BIT | GL_POLYGON_BIT);

		glDisable(GL_LIGHTING);
		glDisable(GL_DEPTH_TEST);
		glPolygonMode(GL_FRONT_AND_BACK, GL_LINE);
		glLineWidth(1.0f);

		if (isAdding)
			glColor3f(0.1f, 0.1f, 1.0f);
		else
			glColor3f(1.0f, 0.1f, 0.1f);

		drawSphere(center[0], center[1], center[2], radius, 10, 10);

		glPopAttrib();
	}
};
#endif
