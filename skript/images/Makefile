#
# Makefile to build linear algebra script
#
# (c) 2009 Prof Dr Andreas Mueller
#
all:	w e v s d linalgmap

w:	w.mp
	TEX=latex mpost w.mp
	for n in 1 2 3 4 5 6 7 8 9 10 11 12 13 14; \
	do \
		mptopdf w.$${n}; \
		pdf2ps w-$${n}.pdf w-$${n}.ps; \
		ps2eps -f w-$${n}.ps; \
	done

e:	e.mp
	TEX=latex mpost e.mp
	for n in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15; \
	do \
		if [ -r e.$${n} ]; \
		then \
			mptopdf e.$${n}; \
			pdf2ps e-$${n}.pdf e-$${n}.ps; \
			ps2eps -f e-$${n}.ps; \
		fi; \
	done

v:	v.mp
	TEX=latex mpost v.mp
	for n in 1 2 3 4 5 6 7 8 9 10; \
	do \
		mptopdf v.$${n}; \
		pdf2ps v-$${n}.pdf v-$${n}.ps; \
		ps2eps -f v-$${n}.ps; \
	done

s:	s.mp
	TEX=latex mpost s.mp
	for n in 1 2 3 4; \
	do \
		mptopdf s.$${n}; \
		pdf2ps s-$${n}.pdf s-$${n}.ps; \
		ps2eps -f s-$${n}.ps; \
	done

d:	d.mp
	TEX=latex mpost d.mp
	for n in 1 2 3 4; \
	do \
		if [ -r d.$${n} ]; \
		then \
			mptopdf d.$${n}; \
			pdf2ps d-$${n}.pdf d-$${n}.ps; \
			ps2eps -f d-$${n}.ps; \
		fi; \
	done

linalgmap:	linalgmap.mp
	TEX=latex mpost linalgmap.mp
	mptopdf linalgmap.1
	pdf2ps linalgmap-1.pdf linalgmap-1.ps
	ps2eps -f linalgmap-1.ps

clean:
	rm -f *.ps {w,e}-*.eps *.pdf *.log {w,e}.[1-9]{,[0-9]} e.mpx
