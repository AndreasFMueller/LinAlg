/*
 * mathman.cpp -- create the mathman logo as an audio file
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#include <cstdlib>
#include <cmath>
#include "logo.h"
#include "path.h"
#include "au.h"
#include "raw.h"
#include "tikz.h"
#include "text.h"
#include "hackfile.h"
#include <getopt.h>
#include <iostream>

namespace mathman {

double	debug = false;

static struct option	longopts[] = {
{ "au",			required_argument,	NULL,	'a' },
{ "debug",		no_argument,		NULL,	'd' },
{ "hackfile",		required_argument,	NULL,	'h' },
{ "scale",		required_argument,	NULL,	's' },
{ "sampling",		required_argument,	NULL,	'S' },
{ "repeat",		required_argument,	NULL,	'r' },
{ "raw",		required_argument,	NULL,	'R' },
{ "tikz",		required_argument,	NULL,	't' },
{ "velocity",		required_argument,	NULL,	'v' },
{ NULL,			0,			NULL,	 0  }
};

int	main(int argc, char *argv[]) {
	int	c;
	int	longindex;
	int	scale = 1;
	int	repeat = 1;
	std::string	aufilename;
	std::string	tikzfilename;
	std::string	rawfilename;
	std::string	hackfilename;
	double	velocity = 10;
	uint32_t	sampling = 44100;

	while (EOF != (c = getopt_long(argc, argv, "a:dh:R:r:S:s:t:v:",
		longopts, &longindex))) {
		switch (c) {
		case 'a':
			aufilename = std::string(optarg);
			break;
		case 'd':
			debug = true;
			break;
		case 'h':
			hackfilename = std::string(optarg);
			break;
		case 'R':
			rawfilename = std::string(optarg);
			break;
		case 'r':
			repeat = std::stoi(optarg);
			break;
		case 'S':
			sampling = std::stoi(optarg);
			break;
		case 's':
			scale = std::stod(optarg);
			break;
		case 't':
			tikzfilename = std::string(optarg);
			break;
		case 'v':
			velocity = std::stod(optarg);
			break;
		}
	}

	// create the logo 
	logo	l;
	draw	d(velocity);
	path	p = d(l);
	std::cout << "total length:   ";
	std::cout << p.size() << " samples" << std::endl;
	std::cout << "base frequency: ";
	std::cout << (sampling/p.size()) << " Hz" << std::endl;
	std::cout << "duration:       ";
	std::cout << (repeat * p.size() / sampling) << " seconds" << std::endl;

	// rescale/center
	point	cent = p.center();
	std::cout << "center: " << cent << std::endl;
	std::cout << std::endl;
	path	moved = p - cent;
	point	mmax = moved.max();
	point	mmin = moved.min();
	double	m = std::max(
		std::max(fabs(mmax.x()), fabs(mmax.y())),
		std::max(fabs(mmin.x()), fabs(mmin.y()))
	);

	// show it
	path	rescaled = moved * (point(1, -1) * (scale/m));
	if (debug) {
		text	t;
		t(p);
	} else if (hackfilename.size() > 0) {
		hackfile	h(hackfilename);
		h.repeats(repeat);
		h.pathwriter::operator()(rescaled);
	} else if (rawfilename.size() > 0) {
		raw	r(rawfilename);
		r.repeats(repeat);
		r.pathwriter::operator()(rescaled);
	} else if (aufilename.size() > 0) {
		au	a(aufilename, sampling);
		a.repeats(repeat);
		a.pathwriter::operator()(rescaled);
	} else if (tikzfilename.size() > 0) {
		tikz	t(tikzfilename);
		t(rescaled);
	} else {
		std::cout << moved * (point(1, -1) * (scale/m));
	}
	return EXIT_SUCCESS;
}

} // namespace mathman

int	main(int argc, char *argv[]) {
	return mathman::main(argc, argv);
}
