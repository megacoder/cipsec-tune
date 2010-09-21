PREFIX	=/opt
BINDIR	=${PREFIX}/bin

SCRIPTS	=cipsec-tune cipsec-watch

all::	${SCRIPTS}

check::	${foreach f,${SCRIPTS},check-$f}

check-cipsec-tune: cipsec-tune
	./cipsec-tune

check-cipsec-watch::	cipsec-watch
	./cipsec-watch

install:: ${SCRIPTS}
	${foreach f,${SCRIPTS},install -D -c $f ${BINDIR}/$f;}

uninstall:
	${foreach f,${SCRIPTS},${RM} ${BINDIR}/$f;}

diff::	${foreach f,${SCRIPTS},$f ${BINDIR}/$f}
	${foreach f,${SCRIPTS},diff -uNp $f ${BINDIR}/$f;}

import:: ${foreach f,${SCRIPTS},${BINDIR}/$f}
	${foreach f,${SCRIPTS},cp ${BINDIR}/$f $f;}
