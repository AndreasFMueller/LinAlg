/*
 * tikz.h
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#ifndef _tikz_h
#define _tikz_h

#include "path.h"
#include "iostream"
#include "fstream"

namespace mathman {

class tikz {
	std::ofstream	out;
public:
	tikz(const std::string& filename);
	~tikz();
	void	operator()(const point& p);
	void	operator()(const path& p);
};

} // namespace mathman

#endif /* _tikz_h */
