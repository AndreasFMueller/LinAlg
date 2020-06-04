/*
 * raw.h
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#ifndef _raw_h
#define _raw_h

#include "path.h"

namespace mathman {

class raw : public pathwriter {
	int	fd;
public:
	raw(const std::string& filename);
	~raw();
	void	operator()(short a);
	void	operator()(double a);
	void	operator()(const point& p);
	void	write(const path& p);
};

} // namespace mathman

#endif /* _raw_h */
