# Makefile for testing POSIX AIO functionality

.PHONY: clean

CC       = gcc
LD		   = gcc

LIBS		= -lrt -lzmq

CFLAGS	= -c -Wall

C_EXT = c
OBJ_EXT = o
EXE_EXT = exe

EXE = zmq_test_1_server.$(EXE_EXT) zmq_test_1_client.$(EXE_EXT)
OBJECTS = zmq_test_1_server.$(OBJ_EXT)	zmq_test_1_client.$(OBJ_EXT)

%.o : %.c
	$(CC) $(CFLAGS) $*.$(C_EXT) -o $*.$(OBJ_EXT)

zmq_test_1_server.$(EXE_EXT): zmq_test_1_server.$(OBJ_EXT) $(DRIVER)
	$(LD) -o zmq_test_1_server.$(EXE_EXT) $^ $(LIBS) 

zmq_test_1_client.$(EXE_EXT): zmq_test_1_client.$(OBJ_EXT) $(DRIVER)
	$(LD) -o zmq_test_1_client.$(EXE_EXT) $^ $(LIBS) 


all: $(EXE)
	

clean:
	rm -f $(OBJECTS) $(EXE)
