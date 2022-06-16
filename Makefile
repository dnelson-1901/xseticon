GLIB_CFLAGS!=pkg-config --cflags glib-2.0 x11 xmu gdlib
  GLIB_LIBS!=pkg-config --libs   glib-2.0 x11 xmu gdlib

LIBS=${GLIB_LIBS}
CFLAGS+=${GLIB_CFLAGS}

PREFIX=/usr/local
BINDIR=$(PREFIX)/bin

all: xseticon

xseticon: xseticon.o
	${CC} xseticon.o ${LIBS} -o $@

.PHONY: clean
clean:
	rm -f xseticon.o xseticon

.PHONY: install
install: xseticon
	install -d $(BINDIR)
	install -m 755 xseticon $(BINDIR)
