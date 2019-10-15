// $Id: alienGlut.cpp,v 1.5 2004/11/29 03:12:40 durant Exp durant $
// http://people.msoe.edu/~durant/courses/cs421/alienGlut.cpp
// CS-421 Quiz 2 Supplement
// Dr. E. Durant <durant@msoe.edu>
// Tuesday 6 January 2004

#ifdef _WIN32
#include <windows.h>
#else
#include <cstdlib> // NULL
#endif // _WIN32

#include <GL/glut.h> // do not explicitly include GL/{gl,glu}.h per GLUT specification
#include <GL/gl.h>
#include <GL/glu.h>
#include <cassert>

static GLUquadricObj* pTheQuadric = NULL; // For efficiency, create the quadric object once.
// Only one is needed since multiple quadric states would not benefit this program.

static void drawHead()
{
    assert(pTheQuadric);
    gluSphere(pTheQuadric, 5.0, 8, 8); // state, radius, slices, stacks
}

static void drawAntenna()
{
    assert(pTheQuadric);
    glPushMatrix(); // remember current reference frame so it can be restored
    glRotatef(-90, 1,0,0); // modeling transform: 90 deg CW about x-axis
    gluCylinder(pTheQuadric, 0.25, 0.5, 3.5, 8, 5); // state, radius (bottom, top), height, slices, stacks
    glPopMatrix(); // restore the transform we were given -- this is generally a good policy for modeling functions
}

// display - Callback routine to be invoked by the GLUT Main Loop
//           whenever an exposure/redraw event occurs.
static void display(void)
{
    glClear(GL_COLOR_BUFFER_BIT);        // Clear all pixels

    glColor3f(1.0,1.0,1.0);              // White

    glPushMatrix(); // store transformed world origin

    drawHead();

    glColor3f(0.5,1,0.5); // Green
    glTranslatef(-3, 4, 0); // Move to 1st antenna position
    drawAntenna();

    glPopMatrix(); // recall transformed world origin
    glPushMatrix(); // save another copy for later

    glTranslatef(3, 4, 0); // Move to 2nd antenna position
    glRotatef(-25, 0,0,1); // This antenna is tilted about the modeling z-axis
    drawAntenna();

    glPopMatrix();

    glFlush();        // Flush queue and display now
}

// init - Utility initialization routine to set-up OpenGL projection
//        and viewing modes.
static void init()
{
    pTheQuadric = gluNewQuadric();
    assert(pTheQuadric);

    glClearColor(0.0,0.0,0.0,0.0);        // Set background color to black

    // Set-up basic 3-D viewing with orthographic projection
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(-10,10, -10,10, 2,20); // x range, y range, z extent (positive in front of viewer)

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

    // This is the view diagrammed on the quiz...
    //gluLookAt(5,0,0, 0,0,0, 0,1,0); // from, to, up, in world coordinates
    // This is the view looking at the quiz itself...
    gluLookAt(0,0,5, 0,0,0, 0,1,0);
}

static void cleanup()
{
    if (pTheQuadric)
        gluDeleteQuadric(pTheQuadric);
    pTheQuadric = NULL;
}

// Main program
int main (int argc, char** argv)
{
    glutInit(&argc, argv);                          // Initialize GLUT
    glutInitDisplayMode(GLUT_SINGLE | GLUT_RGB);    // Single, RGB window
    glutInitWindowSize(250,250);                    // 250x250 pixel window
    glutInitWindowPosition(100,100);                // At pixel 100,100 on screen
    glutCreateWindow("CS-421 Quiz 2 Demo");         // Title window
    init();                                         // Set-up viewing
    glutDisplayFunc(display);                       // Install exposure callback
    glutMainLoop();                                 // Start event loop
    cleanup();                                      // Release resources
    return EXIT_SUCCESS;
}
