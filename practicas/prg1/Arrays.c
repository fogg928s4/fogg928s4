#include <stdio.h>
#include <stdlib.h>

int main() {
    int a[] = {1, 2, 3};
    int *b = a;
    int *c = b;

    printf("a[2] = %d\n", a[2]);
    printf("b[2] = %d\n", 2[b]);
    printf("c[2] = %d\n", *(c+2));
    c[2] = 999;
    printf("a[2] = %d\n", a[2]);
    printf("b[2] = %d\n", 2[b]);
    printf("c[2] = %d\n", *(c+2));

    // now some funky shit
    int *d = (int *) malloc(3*sizeof(int));
    d[0] = 2;
    d[1] = 3;
    d[2] = sizeof(int);
    printf("d[2] = %d\n", d[2]);

    // memorias
    printf("direccion de a = %x\n", &a);
    printf("direccion de b = %x\n", &b);
    printf("direccion de c = %x\n", &c);    
    printf("direccion de d = %x\n", &d);
    free(d);
    return 0;
}