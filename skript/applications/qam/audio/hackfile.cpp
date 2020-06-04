/*
 * hackfile.cpp
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#include "hackfile.h"
#include <stdexcept>
#include <cmath>
#include <unistd.h>
#include <fcntl.h>

namespace mathman {

hackpoint::hackpoint(const point& p) {
	int32_t	i = round(p.x() / 256.);
	I = i;
	int32_t	q = round(p.y() / 256.);
	Q = q;
}

hackfile::hackfile(const std::string& filename) {
	fd = open(filename.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0666);
	if (fd < 0) {
		std::cerr << "cannot open file '" << filename << "': ";
		std::cerr << strerror(errno) << std::endl;
		throw std::runtime_error("cannot open output file");
	}
}

hackfile::~hackfile() {
	close(fd);
}

void	hackfile::operator()(const path& p) {
	for (auto const a : p) {
		(*this)(hackpoint(a));
	}
}

void	hackfile::operator()(const hackdata& p) {
	for (auto const a : p) {
		(*this)(a);
	}
}

void	hackfile::operator()(const hackpoint& h) {
	char	iq[2];
	iq[0] = h.I;
	iq[1] = h.Q;
	if (2 != write(fd, iq, 2)) {
		std::cerr << "cannot write IQ: " << strerror(errno);
		std::cerr << std::endl;;
		throw std::runtime_error("cannot write");
	}
}

} // mathman
