# $Id: texgenMod.Makefile,v 1.1 2004/01/20 21:05:09 durant Exp durant $

TARGET = texgenMod
OBJECTS = texgenMod.o
LFLAGS = -lglut -lGLU -lGL -L/usr/X11R6/lib -lXi -lXmu
CXXFLAGS = -Woverloaded-virtual -Werror -pedantic

$(TARGET): $(OBJECTS)
	g++ -o $@ $(OBJECTS) $(LFLAGS)
	
clean:
	rm -f $(OBJECTS)
