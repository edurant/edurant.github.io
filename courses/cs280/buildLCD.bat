@rem To compile
gcc -Wall -Wl,-T -Wl,../fox11w.x -mshort -fno-exceptions -O2 main.cpp LCDDisplay_Fox11.cpp DoorLock.cpp Employee.cpp atoi.cpp getkey.s -o main.elf -lmsoe
@rem (getkey.s can be omitted for non-interactive version, but including it doesn't hurt)
@rem ([Use MSVC to build Windows console version)

@rem Commands to make the S19 file and listing...
objcopy -O srec main.elf main.s19
objdump -C -S main.elf > main.rst
