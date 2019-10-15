# $Id: alienGlut.Makefile,v 1.1 2004/01/06 18:51:37 durant Exp durant $

TARGET = alienGlut
OBJECTS = alienGlut.o
LFLAGS = -lglut -lGLU -lGL -L/usr/X11R6/lib -lXi -lXmu
CXXFLAGS = -Woverloaded-virtual -Werror -pedantic

$(TARGET): $(OBJECTS)
	g++ -o $@ $(OBJECTS) $(LFLAGS)

clean:
	rm -f $(OBJECTS)
