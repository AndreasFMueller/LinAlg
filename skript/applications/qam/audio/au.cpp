/*
 * au.cpp
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswi
 */
#include "au.h"
#include <cstdlib>
#include <cstdio>
#include <cerrno>
#include <fcntl.h>
#include <unistd.h>

namespace mathman {

au::au(const std::string& filename, uint32_t sampling) {
	fd = open(filename.c_str(), O_CREAT | O_TRUNC | O_WRONLY, 0666);
	if (fd < 0) {
		std::cerr << "cannot open output file: ";
		std::cerr << strerror(errno);
		std::cerr << std::endl;
		throw std::runtime_error("cannot open file");
	}
	int	l = 0;
	l += ::write(fd, ".snd", 4);
	if (l < 0) {
		std::cerr << "cannot write: " << strerror(errno) << std::endl;
		throw std::runtime_error("cannot write file");
	}
	uint32_t	v;
	// datenoffset
	v = htonl(28);
	l += ::write(fd, &v, sizeof(v));
	// datengrösse
	v = 0xffffffff;
	l += ::write(fd, &v, sizeof(v));
	// codierung
	v = htonl(3);
	l += ::write(fd, &v, sizeof(v));
	// sample rate
	v = htonl(sampling);
	l += ::write(fd, &v, sizeof(v));
	// kanäle
	v = htonl(2);
	l += ::write(fd, &v, sizeof(v));
	// info
	v = htonl(0);
	l += ::write(fd, &v, sizeof(v));
	std::cout << "header bytes written: " << l << std::endl;
}

au::~au() {
	close(fd);
	fd = -1;
}

void	au::operator()(uint16_t a) {
	::write(fd, &a, 2);
}

void	au::operator()(const point& p) {
	uint16_t	a = htons(p.x());
	::write(fd, &a, 2);
	a = htons(p.y());
	::write(fd, &a, 2);
}

void	au::write(const path& p) {
	for (auto const a : p) {
		(*this)(a);
	}
}

} // namespace mathman
