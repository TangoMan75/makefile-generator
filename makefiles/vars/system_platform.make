#--------------------------------------------------
# Local OS
#--------------------------------------------------

# Local operating system (Windows_NT, Darwin, Linux)
ifeq ($(OS),Windows_NT)
	SYSTEM=$(OS)
else
	SYSTEM=$(shell uname -s)
endif

