CFLAGS  = -Wall -pedantic
LFLAGS  =
CC      = gcc -g
RM      = /bin/rm -rf
AR      = ar rc
RANLIB  = ranlib
LIBRARY = gtthread.a
LIB_SRC = gtthread.c 
LIB_OBJ = $(patsubst %.c,%.o,$(LIB_SRC))

# pattern rule for object files
%.o: %.c
	        $(CC) -c $(CFLAGS) $< -o $@

all: $(LIBRARY)

$(LIBRARY): $(LIB_OBJ)
	        $(AR) $(LIBRARY) $(LIB_OBJ)
	        $(RANLIB) $(LIBRARY)

$(LIB_OBJ) : $(LIB_SRC)
	$(CC) -c $(CFLAGS) $< -g -o $@

$(LIB_SRC):

clean:
	        $(RM) $(LIBRARY) $(LIB_OBJ)

.PHONY: depend
depend:
	        makedepend -Y -- $(CFLAGS) -- $(LIB_SRC)  2>/dev/null
