SRCDIR = CSources
SHAREDLIB = libHello.so

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Linux)
	SHAREDLIBPATH = /usr/lib
endif
ifeq ($(UNAME_S),Darwin)
	SHAREDLIBPATH = /usr/local/lib
endif

Hello: $(SRCDIR)/Hello.c
	clang -shared $(SRCDIR)/Hello.c -I/opt/rubies/2.1.0/include/ruby-2.1.0  -I/opt/rubies/2.1.0/include/ruby-2.1.0/x86_64-darwin14.0 -lruby -o $(SHAREDLIB)
	cp libHello.so $(SHAREDLIBPATH)

clean:
	-rm -f $(SHAREDLIB)
	-rm -f $(SHAREDLIBPATH)/$(SHAREDLIB)
