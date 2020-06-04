/*
 * au.h
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#ifndef _au_h
#define _au_h

#include "path.h"

namespace mathman {

class au : public pathwriter {
	int	fd;
public:
	au(const std::string& filename, uint32_t sampling);
	~au();
	void	operator()(uint16_t a);
	void	operator()(const point& p);
	virtual void	write(const path& p);
};

} // namespace mathman

#endif /* _au_h */
