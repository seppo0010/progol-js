############################################################################
#
#			PROGOL Makefile
#
############################################################################

.SUFFIXES: .pl .cmp
.PHONY: example_chess
LDFLAGS= -lm # -O2
CFLAGS= -O2 # -O2 -g  -pg -f68881
CURRENT_UID := $(shell id -u)
CURRENT_GID := $(shell id -g)
CC:=docker run --rm -v ${CURDIR}:/src -u ${CURRENT_UID}:${CURRENT_GID} emscripten/emsdk emcc -s WASM=1 -g --embed-file ./examples4.2 --embed-file ./examples4.4
OBJECTS= main.o plg.o command.o init.o hash.o func.o set.o \
	item.o list.o utils.o alloc.o terms.o clause.o lib.o \
	integrat.o cost.o bits.o reduce.o sat.o sample.o \
	interp.o deduce.o xy.o subsume.o chi.o
SOURCE= main.c plg.c command.c init.c hash.c func.c set.c \
	item.c list.c utils.c alloc.c terms.c clause.c lib.c \
	integrat.c cost.c bits.c reduce.c sat.c sample.c \
	interp.c deduce.c xy.c subsume.c chi.c

progol.js: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o progol.js $(LDFLAGS)
mem:
	touch item.c init.c plg.c
	make progol
count:
	wc $(SOURCE)
clean:
	 -rm -f *.o
example_chess: progol.js
	node progol.js examples4.2/chess.pl
