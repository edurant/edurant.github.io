// $Id: varshape.cpp,v 1.5 2004/10/20 21:30:55 durant Exp $
// Implementation -- see varshape.h

#include "varshape.h"
#include <qpainter.h>

varshape::varshape(const varshape& src)
: shape(src.type, src.lineColor),		// base class handles type and attributes
  points(src.points)								// handle varshape-specific items
{}

varshape::varshape(char type, const QColor& lc)
: shape(type, lc)	// base class handles type and attributes, could also use *this
// no varshape-specific items (points starts empty)
{}

varshape::~varshape()
{} // no dynamic memory (points handles its own)

varshape& varshape::operator= (const varshape& rhs)	// Assignment =
{
	if (this != &rhs)
	{
		shape::operator=(rhs);	// common shape items: type, color, ...
		points = rhs.points;		// varshape-specific items
		points.detach();	// deep copy
	}
	return *this;
}

void varshape::addNode(const QPoint& qp)
{
	bool success = points.putPoints(points.size(), 1, qp.x(), qp.y());
	assert(success); // Why shouldn't putPoints be called within the assert?
}

void varshape::Write(std::ostream& ostr) const // Output polyline to stream
{
	// Note the asymmetry between Write/Read -- we output the type in Write, but don't read it in Read.
	// This is because, when reading, someone has the read the type in order to instantiate us and call our Read function.
	ostr << type;
	ostr << points.size(); // output point count to make Read easier

	// A better method may be to use a QDataStream and QByteArray to serialize the QPointArray 
	// and then send raw bytes to ostr instead of explicitly doing the serialization here.
	for (QPointArray::ConstIterator cit = points.begin(); cit != points.end(); ++cit)
		ostr << ' ' << cit->x() << ' ' << cit->y();

	shape::Write(ostr); // should handle color and other attributes (we already did type above)
	ostr << std::endl; // end the record for this shape object
}

void varshape::Read(std::istream& istr)	// Input polyline from stream
{
	// See note in "Write"
	unsigned int vertexCount;
	istr >> vertexCount;
	if(istr)
	{
		points.resize(0); // no .clear() in QPointArray
		while (vertexCount--)
		{
			int x, y;
			istr >> x >> y;
			addNode(QPoint(x,y));
		}
	}

	shape::Read(istr); // color and other attributes
}
