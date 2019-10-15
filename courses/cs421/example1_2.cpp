//*********************************************************************
// GLUTtest.cpp
// OpenGL GLUT Library Test File
// Example based on OpenGL Programming Guide 1.{3,4} Example 1-2
// pp. 18-9
//
// Adapted for Windows95/98/NT by H. Welch 5-December-1999
// Adapted for Fedora Core 2 by E. Durant 5-December-2004

// See http://people.msoe.edu/~durant/courses/cs421/glut.shtml
// for instructions for building GLUT applications on various
// platforms including Win32 and Fedora Core 2.
//*********************************************************************

#ifdef _MSC_VER // if under Microsoft compiler
#include <windows.h>
#endif
#include <GL/glut.h> // defined to include gl.h and glu.h.

//*********************************************************************
// display - Callback routine to be invoked by the GLUT Main Loop
//           whenever an exposure/redraw event occurs.
//
// Calls: OpenGL Library
// 
// Written by: Woo, et al.
//
// Modified by: H. Welch 5-December-1999
//              Upgraded documentation
//*********************************************************************
void display(void)
{
	// Clear all pixels
	glClear(GL_COLOR_BUFFER_BIT);

	// Draw white polygon
	glColor3f(1.0,1.0,1.0);		// White
	glBegin(GL_POLYGON);
		glVertex3f(0.25,0.25,0.0);
		glVertex3f(0.75,0.25,0.0);
		glVertex3f(0.75,0.75,0.0);
		glVertex3f(0.25,0.75,0.0);
	glEnd();

	// Flush queue and display now
	glFlush();
}

//*********************************************************************
// init - Utility initialization routine to set-up OpenGL projection
//        and viewing modes.
//
// Calls: OpenGL Library
// 
// Written by: Woo, et al.
//
// Modified by: H. Welch 5-December-1999
//              Upgraded documentation
//*********************************************************************
void init()
{
	// Set background color to black
	glClearColor(0.0,0.0,0.0,0.0);

	// Set-up basic 3-D viewing with orthographic projection
	glMatrixMode(GL_PROJECTION);
	glLoadIdentity();
	glOrtho(0.0,1.0,0.0,1.0,-1.0,1.0);
}


// Main program
int main (int argc, char** argv)
{
	glutInit(&argc, argv);				// Initialize GLUT
	glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);	// Single, RGB window
	glutInitWindowSize(250,250);			// 250x250 pixel window
	glutInitWindowPosition(100,100);		// At pixel 100,100 on screen
	glutCreateWindow("OpenGL GLUT Test");		// Title window
	init();						// Set-up viewing
	glutDisplayFunc(display);			// Install exposure callback
	glutMainLoop();					// Start event loop
	return 0;
}
