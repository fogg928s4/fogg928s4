#!/bin/bash
archivo=$1

gcc ${archivo}.c -o ${archivo} -Wall -Wextra --debug
as -msyntax=intel -mnaked-reg ${archivo}.s -o $archivo.o
ld -s -o $archivo $archivo.o
