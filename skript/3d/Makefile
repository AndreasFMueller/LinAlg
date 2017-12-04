#
# Makefile -- build the color space visualization images
#
# (c) 2016 Prof Dr Andreas Müller, Hochschule Rapperswil
#
povrayoptions = +A0.1 -W1024 -H768

includes = cube.inc rgbaxes.inc uvvectors.inc yuvbox.inc \
	yuvbox.pov clippedyuv.pov clippedrgb.pov

all:	clippedyuv.png

# YUV Box
yuvboxanimation:
	sh ../../povray $(povrayoptions) -Oyuvbox/yuvbox yuvbox.ini

yuvbox.gif:
	convert yuvbox/yuvbox*.png -loop 0 yuvbox.gif

yuvbox.mpg:
	png2yuv -v 1 -I p -f 25 -j yuvbox/yuvbox%03d.png | \
		mpeg2enc -V 500 --no-constraints -q 1 -b 12000 -l m -f 8 \
			-o yuvbox.mpg

yuvbox.png:	yuvboxsingle.pov $(includes)
	sh ../../povray $(povrayoptions) -Oyuvbox.png yuvboxsingle.pov

# RGB cube clipped by Y-level planes
clippedyuvanimation:	clippedyuv.pov $(includes)
	sh ../../povray $(povrayoptions) -Oclippedyuv/clippedyuv clippedyuv.ini

clippedyuv.gif:
	convert clippedyuv/clippedyuv*.png -loop 0 clippedyuv.gif

clippedyuv.mpg:
	png2yuv -v 1 -I p -f 25 -j clippedyuv/clippedyuv%03d.png | \
		mpeg2enc -V 500 --no-constraints -q 1 -b 12000 -l m -f 8 \
			-o clippedyuv.mpg

clippedyuv2.mpg:
	png2yuv -v 1 -I p -f 25 -j clippedyuv2/clippedyuv%03d.png | \
		mpeg2enc -V 500 --no-constraints -q 1 -b 12000 -l m -f 8 \
			-o clippedyuv2.mpg

clippedyuv.png:	clippedyuvsingle.pov $(includes)
	sh ../../povray $(povrayoptions) -Oclippedyuv.png clippedyuvsingle.pov

# RGB cube clipped orthogonally to [1;1;1]
clippedrgbanimation:	clippedrgb.pov $(includes)
	sh ../../povray $(povrayoptions) -Oclippedrgb/clippedrgb clippedrgb.ini

clippedrgb.gif:
	convert clippedrgb/clippedrgb*.png -loop 0 clippedrgb.gif

clippedrgb.mpg:
	png2yuv -v 1 -I p -f 25 -j clippedrgb/clippedrgb%03d.png | \
		mpeg2enc -V 500 --no-constraints -q 1 -b 12000 -l m -f 8 \
			-o clippedrgb.mpg

clippedrgb.png:	clippedrgbsingle.pov $(includes)
	sh ../../povray $(povrayoptions) -Oclippedrgb.png clippedrgbsingle.pov

# simple RGB cube
rgbcube.png:	rgbcube.pov $(includes)
	sh ../../povray $(povrayoptions) -Orgbcube.png rgbcube.pov

cube-new.eps:	cube-new.ps Makefile
	ps2eps --force cube-new.ps
cube-new.pdf:	cube-new.ps Makefile
	gs -o cube-new.pdf -sDEVICE=pdfwrite -dEPSCrop cube-new.ps
hexagon.pdf:	hexagon.ps Makefile
	gs -o hexagon.pdf -sDEVICE=pdfwrite -dEPSCrop hexagon.ps
