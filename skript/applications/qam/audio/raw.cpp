/*
 * raw.cpp
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswi
 */
#include "raw.h"
#include <cstdlib>
#include <cstdio>
#include <cerrno>
#include <fcntl.h>
#include <unistd.h>

namespace mathman {

raw::raw(const std::string& filename) {
	fd = open(filename.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0666);
	if (fd < 0) {
		std::cerr << "cannot open output file: ";
		std::cerr << strerror(errno);
		std::cerr << std::endl;
		throw std::runtime_error("cannot open file");
	}
}

raw::~raw() {
	close(fd);
	fd = -1;
}

void	raw::operator()(short a) {
	short	v = a;
	write(fd, &v, 2);
}

void	raw::operator()(double a) {
	(*this)((short)a);
	
}

void	raw::operator()(const point& p) {
	(*this)(p.x());
	(*this)(p.y());
}

void	raw::operator()(const path& p) {
	for (auto const a : p) {
		(*this)(a);
	}
}

} // namespace mathman
