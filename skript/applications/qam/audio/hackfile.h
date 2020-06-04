/*
 * hackfile.h
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#ifndef _hackfile_h
#define _hackfile_h

#include <vector>
#include "path.h"

namespace mathman {

class hackpoint {
public:
	char	I;
	char	Q;
	hackpoint(char _I, char _Q) : I(_I), Q(_Q) { }
	hackpoint(const point& p);
};

typedef std::vector<hackpoint>	hackdata;

class hackfile {
	int	fd;
public:
	hackfile(const std::string& filename);
	~hackfile();
	void	operator()(const hackpoint& h);
	void	operator()(const path& p);
	void	operator()(const hackdata& p);
};

}

#endif /* _hackfile_h */
