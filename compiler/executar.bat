cls
gcc -o assembler assembler.c ../lib/string.c lib/reader.c lib/formatter.c lib/checker.c
assembler "asm/teste1.asm" "asm/teste2.asm" "asm/teste3.asm" "asm/fibonacci.asm" "asm/binary search.asm" "asm/bubble sort.asm" "asm/forward.asm" "asm/memory.asm"
