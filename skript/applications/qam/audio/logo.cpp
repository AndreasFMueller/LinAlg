/*
 * logo.cpp
 *
 * (c) 2020 Prof Dr Andreas Müller, Hochschule Rapperswil
 */
#include "logo.h"

namespace mathman {

logo::logo() {

	{
		path	p;
		p.push_back(point(50,400));
		p.push_back(point(500,850));
		p.push_back(point(950,400));
		p.push_back(point(765,215));
		p.push_back(point(235,215));
		p.closepath();
		push_back(p);
	}

	{
		path	p;
		p.push_back(point(100,400));
		p.push_back(point(270,570));
		p.push_back(point(333,250));
		p.push_back(point(250,250));
		p.closepath();
		push_back(p);
	}

	{
		path	p;
		p.push_back(point(900,400));
		p.push_back(point(750,250));
		p.push_back(point(667,250));
		p.push_back(point(730,570));
		p.closepath();
		push_back(p);
	}

	{
		path	p;
		p.push_back(point(603,250));
		p.push_back(point(500,510));
		p.push_back(point(397,250));
		p.closepath();
		push_back(p);
	}

	{
		path	p;
		p.push_back(point(500,800));
		p.push_back(point(670,630));
		p.push_back(point(623,363.33));
		p.push_back(point(520,630));
		p.push_back(point(500,630));
		p.push_back(point(480,630));
		p.push_back(point(377,363.33));
		p.push_back(point(330,630));
		p.closepath();
		push_back(p);
	}
}

} // namespace mathman
