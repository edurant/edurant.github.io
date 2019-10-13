//*************************************************
//
// shape.cpp - Defines a base class for graphical shapes
//	       Virtually no functionality is included.
//
// $Id: shape.cpp,v 1.3 2003/09/18 03:53:37 durant Exp $
//
// Written by: H. Welch 9/10/98
//
// Modified by: H. Welch 9/14/98
//		Removed ordering operators and added Clone
//
// Modified by: H. Welch 9/14/99
//		Fixed base pointer destructor problem
//		Removed old-style C void parameter
//		Streamlined copy c-tor and Clone
//
// Modified by: H. Welch 5/10/2001
//		Updated namespacing to reflect modern practice
//		as allowed by the new compiler
//
// Modified by: E. Durant 9/17/2003
//		removed Xform method
//		qualified namespace usage
//*************************************************

#include <iostream>
#include <cassert>

#include "shape.h"

//*************************************************
//
// shape::shape - Constructors for base class shape
//
// Parameters: NONE or shape to copy
//
// Returns: NOTHING (the shape for assignment=)
//
// Written by: H. Welch 9/10/98
//
// Calls: NONE
//
//*************************************************

shape::shape() : type(0) {}
shape::shape(const shape& sh) : type(sh.type) {} 

shape& shape::operator= (const shape& r)
{
	type = r.type;
	return(*this);
}

//*************************************************
//
// shape::~shape - Destructor for base class shape
//		   (DOES NOTHING)
//
// Parameters: NONE
//
// Returns: NOTHING
//
// Written by: H. Welch 9/10/98
//
// Calls: NONE
//
//*************************************************

shape::~shape()
{ // Nothing to delete or free
}

//*************************************************
//
// shape::Draw - Draw shape to screen
//		 Do this via dummy cout
//
// Parameters: NONE
//
// Returns: NOTHING
//
// Written by: H. Welch 9/10/98
//
// Calls: iostream
//
//*************************************************
void shape::Draw() const
{
	std::cout << "Drawing shape of type: " << type << std::endl;
}	

//*************************************************
//
// shape::Write - Write shape to output file
//
// Parameters: ostr - the output stream to use
//
// Returns: NOTHING
//
// Written by: H. Welch 9/10/98
//
// Calls: iostream
//
//*************************************************
void shape::Write(std::ostream& ostr) const
{
	ostr << "Shape of type: " << type << " to file" << std::endl;
}

//*************************************************
//
// shape::Read - Read shape from input file
//		 Base object has no data so does nothing
//
// Parameters: istr - the input stream to use
//
// Returns: NOTHING
//
// Written by: H. Welch 9/10/98
//
// Calls: NONE
//
//*************************************************
void shape::Read(std::istream& istr)
{
	// Nothing to do without data
}

//*************************************************
//
// shape::Clone - Allocate a new shape a return a
//		  copy of the current shape
//
// Parameters: NONE
//
// Returns: Pointer to the new shape
//	    NOTE: The calling entity assumes responsibility for
//	          deleting the clone.
//
// Written by: H. Welch 9/14/98
//
// Calls: NONE
//
//*************************************************

shape* shape::Clone() const
{
	shape* newptr = new shape (*this); 	// Use existing CC
        assert (newptr != 0); 			// or "assert (newptr != NULL);"
	return newptr;
}
