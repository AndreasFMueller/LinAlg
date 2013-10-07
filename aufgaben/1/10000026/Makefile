#
# build image for problem 10000026
#
bild = 10000026-1.pdf

$(bild): 10000026.mp
	TEX=latex mpost 10000026.mp
	for f in 10000026.?; \
	do \
		mptopdf $${f}; \
	done
