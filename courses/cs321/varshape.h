// $Id: varshape.h,v 1.4 2003/10/17 06:15:34 durant Exp durant $
// interface for the varshape abstract base class
// This is a common base class for shapes having arbitrary node counts
// (such as polygon, polyline, Bezier curve, ...).
//////////////////////////////////////////////////////////////////////

#ifndef _VARSHAPE_H_
#define _VARSHAPE_H_

#include "shape.h"
#include <qpoint.h>
#include <qpointarray.h>

class varshape : public shape
{
public:
  // Allow derived classes to pass type character ('o' for polyline, 'g' for polygon, ...)
  varshape(char type, const QColor& lc = Qt::white);

  varshape(const varshape& src);
  varshape& operator= (const varshape& rhs);
  virtual ~varshape();

  // Clone and Draw are not mentioned here.  They are assumed to be pure virtual functions in shape.
  // So, they are pure virtual in varshape as well, making this an abstract base class (cannot instantiate).

  virtual void addNode(const QPoint& qp);   // Add a node/vertex to the varshape

  // Most derived classes should not need to override the following 2 functions.
  // Write makes use of the type variable
  // Read assumes that the type has already been extracted from the stream, reads the number of points, and then reads the remaining data.
  virtual void Write(std::ostream& ostr) const;
  virtual void Read(std::istream& istr);

protected:
  QPointArray points; // The vertex list - has variable size (like a vector)
};

#endif // _VARSHAPE_H_
