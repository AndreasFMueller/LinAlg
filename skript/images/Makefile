#
# Makefile to build linear algebra script
#
# (c) 2009 Prof Dr Andreas Mueller
#
all:	w e v s d linalgmap kirchhoff signal linalgmap

SIGNAL_FILES = signal-1.pdf signal-2.pdf signal-3.pdf signal-4.pdf
W_FILES = w-1.pdf w-2.pdf w-3.pdf w-4.pdf w-5.pdf w-6.pdf w-7.pdf w-8.pdf \
	w-9.pdf w-10.pdf w-11.pdf w-12.pdf w-13.pdf w-14.pdf
E_FILES = e-1.pdf e-2.pdf e-3.pdf e-4.pdf e-5.pdf e-6.pdf e-7.pdf \
	e-8.pdf e-9.pdf e-10.pdf e-11.pdf e-12.pdf e-13.pdf e-14.pdf
V_FILES = v-1.pdf v-2.pdf v-3.pdf v-4.pdf v-5.pdf v-6.pdf v-7.pdf \
	v-8.pdf v-9.pdf v-10.pdf v-11.pdf
D_FILES = d-1.pdf d-2.pdf d-3.pdf d-4.pdf
S_FILES = s-1.pdf s-2.pdf s-3.pdf s-4.pdf
KIRCHHOFF_FILES = kirchhoff-1.pdf kirchhoff-2.pdf kirchhoff-3.pdf \
	kirchhoff-4.pdf kirchhoff-5.pdf kirchhoff-6.pdf kirchhoff-7.pdf \
	kirchhoff-8.pdf kirchhoff-9.pdf kirchhoff-10.pdf \
	kirchhoff-11.pdf kirchhoff-12.pdf kirchhoff-13.pdf
SIGNAL_FILES = signal-1.pdf signal-2.pdf signal-3.pdf signal-4.pdf
LINALGMAP_FILES = linalgmap-1.pdf

w:	$(W_FILES)
e:	$(E_FILES)
v:	$(V_FILES)
s:	$(S_FILES)
d:	$(D_FILES)
linalgmap:	$(LINALGMAP_FILES)
kirchhoff:	$(KIRCHHOFF_FILES)
signal: $(SIGNAL_FILES)

$(W_FILES):	w.mp
	TEX=latex mpost w.mp
	for n in 1 2 3 4 5 6 7 8 9 10 11 12 13 14; \
	do \
		mptopdf w.$${n}; \
	done

$(E_FILES):	e.mp
	TEX=latex mpost e.mp
	for n in 1 2 3 4 5 6 7 8 9 10 11 12 13 14; \
	do \
		mptopdf e.$${n}; \
	done

$(V_FILES):	v.mp
	TEX=latex mpost v.mp
	for f in v.*; \
	do \
		mptopdf $${f}; \
	done

$(S_FILES):	s.mp
	TEX=latex mpost s.mp
	for n in 1 2 3 4; \
	do \
		mptopdf s.$${n}; \
	done

$(D_FILES):	d.mp
	TEX=latex mpost d.mp
	for n in 1 2 3 4; \
	do \
		mptopdf d.$${n}; \
	done

$(LINALGMAP_FILES):	linalgmap.mp
	TEX=latex mpost linalgmap.mp
	mptopdf linalgmap.1

$(KIRCHHOFF_FILES):	kirchhoff.mp
	TEX=latex mpost kirchhoff.mp
	for i in `seq 1 1 13`; \
	do \
		mptopdf kirchhoff.$${i}; \
	done

$(SIGNAL_FILES):	signal.mp
	TEX=latex mpost signal.mp
	for i in 1 2 3 4 5; \
	do \
		mptopdf signal.$${i}; \
	done

clean:
	rm -f *.ps *.eps *.pdf *.log *.[1-9]{,[0-9]} *.mpx *.timestamp

