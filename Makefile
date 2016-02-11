PATHI = include/
PATHS = src/
PATHO = build/obj/
PATHB = build/

BUILD_PATHS = $(PATHI) $(PATHS) $(PATHB) $(PATHO)
CLEANUP = rm -r

MKDIR = mkdir -p
COMPILE = gcc -c
LINK = gcc
CFLAGS = -I. -I$(PATHI) -I$(PATHS)

DEPENDS = $(PATHI)basic.h $(BUILD_PATHS)
OBJECTS := $(PATHO)basic.o $(PATHO)main.o

$(PATHB)main.out : $(OBJECTS)
	$(LINK) -o $@ $^

$(PATHO)%.o: $(PATHS)%.c $(DEPENDS)
	$(COMPILE) $(CFLAGS) -o $@ $< 

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
