//*************************************************
//
// shape.h - Declares a base class for graphical shapes
//
// $Id: shape.h,v 1.3 2003/09/18 03:53:32 durant Exp $
//
// Written by: H. Welch 9/10/98
//
// Modified by: H. Welch 9/14/98
//		Removed ordering operators and added Clone
//
// Modified by: H. Welch 9/14/99
//		Fixed base pointer destructor problem
//		Removed old-style C void parameters
//
// Modified by: H. Welch 5/10/2001
//		Updated namespacing to reflect modern practice
//		as allowed by the new compiler
//
// Modified by: E. Durant 9/17/2003
//		removed Xform method
//		qualified namespace usage
//*************************************************

#ifndef SHAPE_H
#define SHAPE_H

#include <iostream>

class shape
{

protected:
	int	type;				// To support Read and Write
	
public:
	shape();				// Constructor
	shape(const shape& sh);			// Copy constructor
	shape& operator= (const shape& r);	// Assignment =
	
	virtual ~shape();				// Destructor
	
	// Virtual methods
	virtual void Draw() const;		// Draw the shape
	virtual void Write(std::ostream& ostr) const;// Output shape to file
	virtual void Read(std::istream& istr);	// Input shape from file
	virtual shape* Clone() const;		// Return a new copy

};
#endif
