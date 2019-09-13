#
# Makefile -- Skript in einzelne Kapitel zerlegen
#
# (c) 2016 Prof Dr Andreas Müller, Hochschule Rapperswil
#
parts =	skript-00-intro.pdf			\
	skript-01-chapter1.pdf			\
	skript-02-chapter2.pdf			\
	skript-03-chapter3.pdf			\
	skript-04-chapter4.pdf			\
	skript-05-chapter5.pdf			\
	skript-06-chapter6.pdf			\
	skript-07-chapter7.pdf			\
	skript-08-chapter8.pdf			\
	skript-09-index.pdf

parts: $(parts)

skript-00-intro.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-00-intro.pdf ../skript.pdf  1-12

skript-01-chapter1.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-01-chapter1.pdf ../skript.pdf 13-74

skript-02-chapter2.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-02-chapter2.pdf ../skript.pdf 75-100

skript-03-chapter3.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-03-chapter3.pdf ../skript.pdf 101-140

skript-04-chapter4.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-04-chapter4.pdf ../skript.pdf 141-172

skript-05-chapter5.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-05-chapter5.pdf ../skript.pdf 173-186

skript-06-chapter6.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-06-chapter6.pdf ../skript.pdf 187-220

skript-07-chapter7.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-07-chapter7.pdf ../skript.pdf 221-236

skript-08-chapter8.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-08-chapter8.pdf ../skript.pdf 237-264

skript-09-index.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-09-index.pdf ../skript.pdf 264-267

