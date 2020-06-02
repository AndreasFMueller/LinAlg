/*
 * path.cpp
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#include <cmath>
#include "path.h"

namespace mathman {

point	point::operator+(const point& other) const {
	return point(x() + other.x(), y() + other.y());
}

point	point::operator-(const point& other) const {
	return point(x() - other.x(), y() - other.y());
}

point	point::operator*(const double l) const {
	return point(x() * l, y() * l);
}

point	point::operator*(const point& s) const {
	return point(x() * s.x(), y() * s.y());
}

bool	point::operator==(const point& other) const {
	return (x() == other.x()) && (y() == other.y());
}

bool	point::operator!=(const point& other) const {
	return (x() != other.x()) || (y() != other.y());
}

point	operator*(const double l, const point& a) {
	return a * l;
}

double	point::length() const {
	return hypot(x(), y());
}

double	distance(const point& a, const point& b) {
	return (a - b).length();
}

std::ostream&	operator<<(std::ostream& out, const point& p) {
	out << p.x() << "," << p.y() << std::endl;
	return out;
}

double	path::length() const {
	double	totallength = 0.;
	if (size() <= 1) {
		return totallength;
	}
	std::list<point>::const_iterator 	i = begin();
	point	previous = *i++;
	while (i != end()) {
		point	next = *i++;
		totallength += distance(previous, next);
		previous = next;
	}
	return totallength;
}

void	path::closepath() {
	if (size() <= 1) {
		return;
	}
	point	first = *begin();
	point	last = *rbegin();
	if (first != last) {
		push_back(first);
	}
}

void	path::add(const path& p) {
	for (auto a : p) {
		push_back(a);
	}
}

point	path::center() const {
	point	s;
	for (auto p : *this) {
		s = s + p;
	}
	return (1. / size()) * s;
}

path	path::operator+(const point& t) {
	path	result;
	for (auto p : *this) {
		result.push_back(p + t);
	}
	return result;
}

path	path::operator-(const point& t) {
	path	result;
	for (auto p : *this) {
		result.push_back(p - t);
	}
	return result;
}

path	path::operator*(const double s) {
	path	result;
	for (auto p : *this) {
		result.push_back(p * s);
	}
	return result;
}

path	path::operator*(const point& s) {
	path	result;
	for (auto p : *this) {
		result.push_back(p * s);
	}
	return result;
}

point	path::min() const {
	double	x = std::numeric_limits<double>::infinity();
	double	y = std::numeric_limits<double>::infinity();
	for (auto const p : *this) {
		if (p.x() < x) {
			x = p.x();
		}
		if (p.y() < y) {
			y = p.y();
		}
	}
	return point(x, y);
}

point	path::max() const {
	double	x = -std::numeric_limits<double>::infinity();
	double	y = -std::numeric_limits<double>::infinity();
	for (auto const p : *this) {
		if (p.x() > x) {
			x = p.x();
		}
		if (p.y() > y) {
			y = p.y();
		}
	}
	return point(x, y);
}

std::ostream&	operator<<(std::ostream& out, const path& p) {
	for (auto const	a : p) {
		out << a;
	}
	return out;
}

double	pathlist::length() const {
	double	totallength = 0;
	for (auto p : *this) {
		totallength += p.length();
	}
	return totallength;
}

path	draw::operator()(const segment& s, bool drawstart) const {
	path	result;
	double	l = s.length();
	int	n = trunc(l / v()) + 1;
	point	vvector = (1. / n) * (s.b() - s.a());
	for (int i = 0; i <= n; i++) {
		point	p = s.a() + i * vvector;
		result.push_back(p);
	}
	return result;
}

path	draw::operator()(const path& p) const {
	path	result;
	if (p.size() <= 1) {
		return result;
	}
	std::list<point>::const_iterator	i = p.begin();
	point	previous = *i++;
	bool	first = true;
	while (i != p.end()) {
		point	next = *i++;
		result.add((*this)(segment(previous, next), first));
		first = false;
		previous = next;
	}
	return result;
}

path	draw::operator()(const pathlist& pl) const {
	path	result;
	for (auto const p : pl) {
		result.add((*this)(p));
	}
	return result;
}

std::ostream&	operator<<(std::ostream& out, const pathlist& pl) {
	for (auto const p : pl) {
		out << p;
	}
	return out;
}

} // namespace mathman
