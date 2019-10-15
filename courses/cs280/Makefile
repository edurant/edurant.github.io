# NMAKE (Microsoft Visual Studio Make) rules for CS-280 Lab 5
# By Dr. E. Durant <durant@msoe.edu> 4/10/2005
# Adapted from version for Motorola 56303 tools written in 2000.
# $Id: Makefile,v 1.1 2005/04/10 23:37:44 durant Exp durant $

### Section 1/3: Configuration, file lists, etc.
# Put the basename of the lab in a macro so this Makefile can be more easily reused.
target=lab5

# List the .cpp files that need to be compiled to .s files
cppfiles=main.cpp DoorLock.cpp Employee.cpp atoi.cpp LCDDisplay_Fox11.cpp

# List the hand-written .s files - don't let these names collide with anything above
# (LCDDisplay_Fox11.s will be created, so we add _supp to the supplemental file here).
# getkey.s is only needed for the interactive version, but including it for all
# versions will not hurt (except for a little bit of wasted memory).
sfiles=LCDDisplay_Fox11_supp.s getkey.s

# Variable to hold the name of the linker configuration file to use
xfile=../fox11w.x

# In NMAKE, we can only override environment variables if they exist (we cannot easily create them),
# so we use NMAKE macros for the C++ (headers) and linker (external library code) include paths.
cpath= -IC:\usr\lib\gcc-lib\m6811-elf\3.3.5-m68hc1x-20050515\include -IC:\usr\lib\gcc-lib\m6811-elf\3.3.5-m68hc1x-20050129\include -IC:\usr\m6811-elf\include
ldpath=-L\usr\m6811-elf\lib\mshort -L\usr\lib\gcc-lib\m6811-elf\3.3.5-m68hc1x-20050129\mshort -L\usr\lib\gcc-lib\m6811-elf\3.3.5-m68hc1x-20050515\mshort

# Tell NMAKE that it should apply rules to create the following types (adds to defaults of .cpp, .exe, etc.).
.SUFFIXES : .s .o .elf .s19 .rst

# Specify which CRT (C runtime) to use -- this takes care of code that runs before main(), etc.
crt=\usr\lib\gcc-lib\m6811-elf\3.3.5-m68hc1x-20050515\mshort\crt1.o

### Section 2/3: Default rules for GCC suite for the Motorola 68HC11
# Rule to run the compiler to convert a .cpp file to a .s file
.cpp.s:
    gcc -mshort -fomit-frame-pointer -fno-exceptions -O2 -S $*.cpp $(cpath)
# Rule to run the assembler to convert a .s file to a .o file
.s.o:
    as -o $*.o $*.s
.elf.s19:
    objcopy -O srec $*.elf $*.s19
.elf.rst:
    objdump -C -S $*.elf > $*.rst

### Section 3/3: Detailed Rules
# The first rule is what is built if we just type "nmake" - we usually want the .elf, the .s19, and the .rst.
# Technically, we're saying to acheive the goal "all", nmake must acheive all the goals on the right of the colon.
# $(variable) substitutes a variable's value.
all : $(target).elf $(target).s19 $(target).rst

# Dependencies: Tell nmake that all .s files it creates must be updated if
# the corresponding .h or .cpp files and certain other .h/.s files ever change.
# That is, recompile a module if its code or any interfaces it uses change.
# Manually entered -- dependencies could also be fetched by manually running the preprocessor.
main.s             :                                main.cpp DoorLock.h Employee.h
DoorLock.s         :         DoorLock.h         DoorLock.cpp Employee.h atoi.h
Employee.s         :         Employee.h         Employee.cpp
atoi.s             :             atoi.h             atoi.cpp
LCDDisplay_Fox11.s : LCDDisplay_Fox11.h LCDDisplay_Fox11.cpp LCDDisplay_Fox11_supp.s Display.h

# Rule to build the ELF by linking all objects generated from both cppfiles and sfiles
# $(variable:text1=text2) substitutes a variable with text replacement.
$(target).elf : $(cppfiles:.cpp=.o) $(sfiles:.s=.o)
    ld -T $(xfile) -o $@ $(crt) $(cppfiles:.cpp=.o) $(sfiles:.s=.o) $(ldpath) -lmsoe -lgcc

# Rule to delete the intermediate files.  One purpose is to ensure a fresh build
# in the event that a dependency rule is missing or not working ("nmake clean").
clean :
    del /q *.o
    del /q $(cppfiles:.cpp=.s)

# Rule to delete all outputs -- "clean" is a prerequisite, so it will happen first.
cleantarget : clean
    del /q *.s19 *.rst *.elf
