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
	pdfjam --outfile skript-00-intro.pdf ../skript.pdf  1-10

skript-01-chapter1.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-01-chapter1.pdf ../skript.pdf 11-60

skript-02-chapter2.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-02-chapter2.pdf ../skript.pdf 61-86

skript-03-chapter3.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-03-chapter3.pdf ../skript.pdf 87-130

skript-04-chapter4.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-04-chapter4.pdf ../skript.pdf 131-158

skript-05-chapter5.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-05-chapter5.pdf ../skript.pdf 159-168

skript-06-chapter6.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-06-chapter6.pdf ../skript.pdf 169-176

skript-07-chapter7.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-07-chapter7.pdf ../skript.pdf 177-192

skript-08-chapter8.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-08-chapter8.pdf ../skript.pdf 193-220

skript-09-index.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-09-index.pdf ../skript.pdf 221-223

