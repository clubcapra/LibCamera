CC = g++
CFLAGS = -Wall -fexceptions -fPIC -I/usr/include/python2.7 -I/usr/lib/python2.7/dist-packages/numpy/core/include/numpy -g -c -std=c++11
LDFLAGS = -lrt -lopencv_core -lopencv_highgui -lpython2.7 -lboost_python -lpthread

all : camera.so

camera.o: camera.cpp
			$(CC) $(CFLAGS) camera.cpp 
main.o: main.cpp
		$(CC) $(CFLAGS) main.cpp 
		
mainTest.o: mainTest.cpp
		$(CC) $(CFLAGS) mainTest.cpp 

camera.so: main.o camera.o
			$(CC) -shared main.o camera.o -o camera.so x64/4.5/libPvAPI.a x64/4.5/libImagelib.a $(LDFLAGS)
camera: mainTest.o camera.o
	$(CC) mainTest.o camera.o -o bin/Debug/camera x64/4.5/libPvAPI.a x64/4.5/libImagelib.a $(LDFLAGS)

install:camera.so
	sudo cp camera.so /usr/lib/python2.7/
	
clean: 
	rm -rf *.o camera.so

