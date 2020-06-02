/*
 * text.cpp
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswi
 */
#include "text.h"
#include <cstdlib>
#include <cstdio>
#include <cerrno>
#include <iostream>

namespace mathman {

text::text() {
}

text::~text() {
}

void	text::operator()(const point& p) {
	std::cout << p.x() << "," << p.y() << std::endl;
}

void	text::operator()(const path& p) {
	for (auto const a : p) {
		(*this)(a);
	}
}

} // namespace mathman
