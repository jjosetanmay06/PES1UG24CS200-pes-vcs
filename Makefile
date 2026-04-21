CC = gcc
CFLAGS = -Wall -Wextra -O2
LDFLAGS = -lcrypto

# ─── Main binary ─────────────────────────────────────────────────────────────
CC = gcc
CFLAGS = -Wall -Wextra -O2
LDFLAGS = -lcrypto

# Object files
OBJS = object.o tree.o index.o commit.o pes.o

# Default target
all: pes

# Build main program
pes: $(OBJS)
	$(CC) $(CFLAGS) -o pes $(OBJS) $(LDFLAGS)

# Compile individual source files
object.o: object.c pes.h
	$(CC) $(CFLAGS) -c object.c -o object.o

tree.o: tree.c pes.h tree.h index.h
	$(CC) $(CFLAGS) -c tree.c -o tree.o

index.o: index.c pes.h index.h
	$(CC) $(CFLAGS) -c index.c -o index.o

commit.o: commit.c pes.h commit.h
	$(CC) $(CFLAGS) -c commit.c -o commit.o

pes.o: pes.c pes.h
	$(CC) $(CFLAGS) -c pes.c -o pes.o

# Test: object store
test_objects: test_objects.o object.o
	$(CC) $(CFLAGS) -o test_objects test_objects.o object.o $(LDFLAGS)

test_objects.o: test_objects.c
	$(CC) $(CFLAGS) -c test_objects.c -o test_objects.o

# Test: tree (FIXED dependencies)
test_tree: test_tree.o tree.o index.o object.o
	$(CC) $(CFLAGS) -o test_tree test_tree.o tree.o index.o object.o $(LDFLAGS)

test_tree.o: test_tree.c
	$(CC) $(CFLAGS) -c test_tree.c -o test_tree.o

# Clean everything
clean:
	rm -f pes test_objects test_tree *.o
	rm -rf .pes










