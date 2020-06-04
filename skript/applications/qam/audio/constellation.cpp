/*
 * constellation.cpp
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#include <string>
#include <cstdlib>
#include "path.h"
#include "au.h"
#include "hackfile.h"
#include <vector>
#include <getopt.h>

namespace mathman {

class constellation : public std::vector<point> {
	int	_scale;
	point	_offset;
	void	add(int x, int y) {
		push_back(_scale * (_offset + point(18 * x, 18 * y)));
	}
	void	addpoints() {
		add(0, -6);
		for (int y = -5; y <= 1; y++) {
			add( 6 + y, y);
			add(-6 - y, y);
		}
		for (int y = 2; y <= 4; y++) {
			add( 8 - y, y);
			add(-8 + y, y);
		}
		for (int x = -3; x <= 3; x++) {
			add(x, 4);
		}
		add(-4, -1); add( 4, -1);
		add(-4,  0); add( 4,  0);
		add(-4,  1); add( 4,  1);
		add(-3,  3); add( 3,  3);
		for (int x = 1; x <= 3; x++) {
			add( x, -1 + x);
			add(-x, -1 + x);
		}
		add(0,-1);
	}
public:
	constellation(const point& offset) : _scale(1), _offset(offset) {
		addpoints();
	}
	constellation() : _scale(1){
		addpoints();
	}
	constellation(int scale) : _scale(scale) {
		addpoints();
	}
	point	random() const {
		int	i = ::random() % size();
		return (*this)[i];
	}
	path	operator()(int samples, int length) const {
		path	result;
		for (int s = 0; s < samples; s++) {
			point	p = random();
			for (int i = 0; i < length; i++) {
				result.push_back(p);
			}
		}
		return result;
	}
};

static struct option    longopts[] = {
{ "au",			required_argument,	NULL,	'a' },
{ "hackfile",		required_argument,	NULL,	'h' },
{ "repeat",		required_argument,	NULL,	'r' },
{ "scale",		required_argument,	NULL,	'S' },
{ "samples",		required_argument,	NULL,	's' },
{ "time",		required_argument,	NULL,	't' },
{ NULL,			0,			NULL,	 0  }
};

int	main(int argc, char *argv[]) {
	//constellation	c(point(126, 126));
	int	samples = 100;
	int	c;
	int	longindex;
	int	t = 1;
	int	repeat = 1;
	double	scale = 1;
	std::string	aufilename;
	std::string	hackfilename;

	while (EOF != (c = getopt_long(argc, argv, "a:r:S:s:t:", longopts,
		&longindex))) {
		switch (c) {
		case 'a':
			aufilename = std::string(optarg);
			break;
		case 'h':
			hackfilename = std::string(optarg);
			break;
		case 'r':
			repeat = std::stoi(optarg);
			break;
		case 's':
			samples = std::stoi(optarg);
			break;
		case 'S':
			scale = std::stod(optarg);
			break;
		case 't':
			t = std::stoi(optarg);
			break;
		}
	}

	constellation	C(scale);
	
	for (int i = 0; i < samples; i++) {
		std::cout << "[" << i << "] ";
		std::cout << C.random();
	}

	path	p = C(samples, t);

	if (aufilename.size() > 0) {
		au	a(aufilename, 44100);
		a.repeats(repeat);
		a.pathwriter::operator()(p);
	}

	if (hackfilename.size() > 0) {
		hackfile	h(hackfilename);
		h.repeats(repeat);
		h.pathwriter::operator()(p);
	}

	return EXIT_SUCCESS;
}

} // namespace mathman

int	main(int argc, char *argv[]) {
	return mathman::main(argc, argv);
}
