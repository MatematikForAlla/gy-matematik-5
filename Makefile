# $Id$
# Author:	Daniel Bosk <daniel@bosk.se>
# Date:		5 Aug 2013

SERVER= 	secure.itm.miun.se
PUBDIR= 	/home/danbos/www
CATEGORY= 	pub

DOCUMENTS=	matematik-5.pdf
FILES=		matematik-5.tex frontmatter.tex backmatter.tex matematik-5.bib
FILES+= 	preface.tex
FILES+= 	intro.tex
FILES+= 	differentialekv.tex

USE_LATEXMK= 	yes
USE_BIBLATEX= 	yes

matematik-5.pdf matematik-5.ps: ${FILES}

clean:
	${RM} figs/*-converted-to.pdf
	${RM} matematik-5-1.asy matematik-5-1.pdf matematik-5.pre

miun.depend.mk:
ifeq (${MAKE},gmake)
	lynx -dump http://ver.miun.se/build/$@ > $@
else
	wget http://ver.miun.se/build/$@
endif

include miun.depend.mk
include miun.docs.mk
