/*
 * path.h
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswi
 */
#ifndef _path_h
#define _path_h

#include <list>
#include <iostream>

namespace mathman {

class point {
	double	_x;
	double	_y;
public:
	double	x() const { return _x; }
	void	x(double x) { _x = x; }
	double	y() const { return _y; }
	void	y(double y) { _y = y; }
	point(double x, double y) : _x(x), _y(y) { }
	point() : _x(0), _y(0) { }
	point	operator-(const point& other) const;
	point	operator+(const point& other) const;
	point	operator*(const double l) const;
	point	operator*(const point& s) const;
	bool	operator==(const point& other) const;
	bool	operator!=(const point& other) const;
	double	length() const;
};

point	operator*(const double l, const point& a);
double	distance(const point& a, const point& b);
std::ostream&	operator<<(std::ostream& out, const point& p);

class segment {
	point	_a;
	point	_b;
public:
	const point&	a() const { return _a; }
	const point&	b() const { return _b; }
	segment(const point& a, const point& b) : _a(a), _b(b) { }
	double	length() const { return distance(_a, _b); }
};

class path : public std::list<point> {
public:
	path() { }
	double	length() const;
	void	closepath();
	void	add(const path& other);
	point	center() const;
	path	operator+(const point& t);
	path	operator-(const point& t);
	path	operator*(double s);
	path	operator*(const point& s);
	point	max() const;
	point	min() const;
};

std::ostream&	operator<<(std::ostream& out, const path& p);

class pathlist : public std::list<path> {
public:
	pathlist() { }
	double	length() const;
};

class draw {
	double	_v;
public:
	double	v() const { return _v; }
	void	v(double v) { _v = v; }
	draw() : _v(1) { }
	draw(double v) : _v(v) { }
	path	operator()(const segment& s, bool drawstart = true) const;
	path	operator()(const path& s) const;
	path	operator()(const pathlist& s) const;
};

std::ostream&	operator<<(std::ostream& out, const pathlist& p);

} // namespace mathman

#endif /* _path_h */
