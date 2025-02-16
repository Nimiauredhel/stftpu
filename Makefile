PROGRAM=program
ARGS=

default:
	gcc *.c -o $(PROGRAM).o
	sudo setcap 'CAP_NET_BIND_SERVICE=ep' $(PROGRAM).o
                                     
strict:                              
	bear -- gcc *.c -std=c99 -Wall -pedantic -Wextra -o $(PROGRAM).o
	sudo setcap 'CAP_NET_BIND_SERVICE=ep' $(PROGRAM).o
                    
debug:              
	gcc *.c -std=c99 -Wall -pedantic -Wextra -g -o0 -o $(PROGRAM).o
	sudo setcap 'CAP_NET_BIND_SERVICE=ep' $(PROGRAM).o

run:
	./$(PROGRAM).o $(ARGS)

andrun:
	gcc *.c -o $(PROGRAM).o
	sudo setcap 'CAP_NET_BIND_SERVICE=ep' $(PROGRAM).o
	./$(PROGRAM).o $(ARGS)

gdb:
	gdb ./$(PROGRAM).o $(ARGS)

valgrind:
	valgrind -s --leak-check=yes --track-origins=yes ./$(PROGRAM).o $(ARGS)

clean:
	rm -f $(PROGRAM).o
	rm -f compile_commands.json

