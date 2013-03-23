#	From: @(#)Makefile	8.2 (Berkeley) 12/15/93
# $FreeBSD: src/lib/libtelnet/Makefile,v 1.10 1999/08/28 00:05:40 peter Exp $

LIB=	telnet
SRCS=	genget.c getent.c misc.c encrypt.c enc_des.c auth.c kerberos.c krb4encpwd.c kerberos5.c forward.c sra.c read_password.c
CFLAGS+= -Wno-unused -DHAS_CGETENT -DAUTHENTICATION -DENCRYPTION -DDES_ENCRYPTION -DRSA -DKRB4 -DKRB5 -DFORWARD -I.
NOPIC=	true

#
# Remove obsolete shared libraries, if any.  We don't bother moving them
# to/usr/lib/compat, since they were only used by telnet, telnetd and
# tn3270.
#
beforeinstall:
	rm -f ${DESTDIR}${SHLIBDIR}/lib${LIB}.so.2.0

.include <bsd.lib.mk>

