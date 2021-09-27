PHP_CPP_BASE    = ../..
CPP             = g++
RM              = rm -f
CPP_FLAGS       = -Wall -c -I/. -I${PHP_CPP_BASE} -I${PHP_CPP_BASE}/include -O2 -std=c++11 -D_GLIBCXX_USE_CXX11_ABI=0 -DNDEBUG
LD              = g++
LD_FLAGS        = -Wall -shared -O2 
RESULT          = astc_pdr.so
SOURCES         = $(wildcard *.cpp)
OBJECTS         = $(SOURCES:%.cpp=%.o)

all: ${OBJECTS} ${RESULT}

${RESULT}: ${OBJECTS}
	${LD} ${LD_FLAGS} -o $@ ${OBJECTS} ${PHP_CPP_BASE}/libphpcpp.a.2.1.4 libastcpdr.a libastc-encoder.a -pthread libstdc++.a

clean:
	${RM} *.obj *~* ${OBJECTS} ${RESULT}

${OBJECTS}: 
	${CPP} ${CPP_FLAGS} -fpic -o $@ ${@:%.o=%.cpp}
