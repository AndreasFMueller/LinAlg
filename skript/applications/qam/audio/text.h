/*
 * text.h
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#ifndef _text_h
#define _text_h

#include "path.h"

namespace mathman {

class text {
public:
	text();
	~text();
	void	operator()(const point& p);
	void	operator()(const path& p);
};

} // namespace mathman

#endif /* _text_h */
