/*
 * tikz.cpp
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswi
 */
#include "tikz.h"
#include <cstdlib>
#include <cstdio>
#include <cerrno>
#include <fcntl.h>
#include <unistd.h>

namespace mathman {

tikz::tikz(const std::string& filename) : out(filename.c_str()) {
}

tikz::~tikz() {
	out << ";" << std::endl;
	out.close();
}

void	tikz::operator()(const point& p) {
	out << "--(" << p.x() << "," << p.y() << ")" << std::endl;
}

void	tikz::operator()(const path& p) {
	point	a = *p.begin();
	out << "\\draw[color=red,line width=0.3pt] (" << a.x() << "," << a.y() << ")";
	out << std::endl;
	for (auto const a : p) {
		(*this)(a);
	}
}

} // namespace mathman
