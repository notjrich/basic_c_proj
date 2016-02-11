PATHI = include/
PATHS = src/
PATHO = build/obj/
PATHB = build/

BUILD_PATHS = $(PATHI) $(PATHS) $(PATHB) $(PATHO)

MKDIR = mkdir -p
COMPILE = gcc -c
LINK = gcc
CFLAGS = -I. -I$(PATHI) -I$(PATHS)

DEPENDS = $(PATHI)basic.h $(BUILD_PATHS)
OBJECTS := $(PATHO)basic.o $(PATHO)main.o

$(PATHB)main.out : $(OBJECTS)
	$(LINK) -o $@ $^

$(PATHO)basic.o: $(PATHS)basic.c $(DEPENDS)
	$(COMPILE) $(CFLAGS) -o $@ $(PATHS)basic.c 

$(PATHO)main.o: $(PATHS)main.c $(DEPENDS)
	$(COMPILE) $(CFLAGS) -o $@ $(PATHS)main.c

.PHONY: clean
clean:
	$(CLEANUP) $(PATHO)*.o
	$(CLEANUP) $(PATHB)*.out

#Create Build Paths
$(PATHI):
	$(MKDIR) $(PATHI)

$(PATHS):
	$(MKDIR) $(PATHS)

$(PATHO):
	$(MKDIR) $(PATHO)

$(PATHB):
	$(MKDIR) $(PATHB)
