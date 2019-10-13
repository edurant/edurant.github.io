//*************************************************
//
// image.h - Declares a container class for groups of
//	     graphical shapes
//
// $Id: image.h,v 1.3 2003/09/18 03:53:44 durant Exp $
//
// Written by: H. Welch 9/10/98
//
// Modified by: H. Welch 9/14/98
//		Switched to storage of pointers
//
// Modified by: H. Welch 9/2/99
//		Changed Expose to ReDraw to avoid name
//		conflicts with X
//
// Modified by: H. Welch 9/14/99
//		Removed C style void parameters
//
// Modified by: H. Welch/4/2001
//		Added const to Redraw and Write to set a proper example
//
// Modified by: E. Durant 9/17/2003
//		removed Xform method
//		qualified namespace usage
//		documented non-virtual destructor
//*************************************************

#ifndef IMAGE_H
#define IMAGE_H

#include <iostream>

#include "shape.h"

class image
{

private:
	// You must decide which data objects are appropriate
	
public:
	image();				// Constructor
	image(const image& im);			// Copy constructor
	image& operator= (const image& r);	// Assignment =
	
	~image();				// Destructor
	// non-virtual destructor saves vtable overhead since there are
	// no virtual functions in image -- need to update if
	// (1) any classes are derived from image AND
	// (2) base pointers (image*) are used to refer to them
	
	// Methods for management
	void Add(shape* sh_ptr);		// Add shape to image

	// Methods for I/O
	void ReDraw() const;			// Draw all the shapes in the image
	void Write(std::ostream& ostr) const;	// Output image shapes to file
	void Read(std::istream& istr);		// Input image shapes from file

	// Methods for changing an image
	void Zoom();				// Zoom the image
	void Unzoom();				// Unzoom the image
	void Reset();				// Reset the image
	void Erase();				// Erase the image

};
#endif
