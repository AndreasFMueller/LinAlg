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
	skript-07-index.pdf

parts: $(parts)

skript-00-intro.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-00-intro.pdf ../skript.pdf  1-10

skript-01-chapter1.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-01-chapter1.pdf ../skript.pdf 11-56

skript-02-chapter2.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-02-chapter2.pdf ../skript.pdf 57-80

skript-03-chapter3.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-03-chapter3.pdf ../skript.pdf 81-118

skript-04-chapter4.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-04-chapter4.pdf ../skript.pdf 119-166

skript-05-chapter5.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-05-chapter5.pdf ../skript.pdf 167-182

skript-06-chapter6.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-06-chapter6.pdf ../skript.pdf 183-210

skript-07-index.pdf:	../skript.pdf Makefile
	pdfjam --outfile skript-07-index.pdf ../skript.pdf 211-213

