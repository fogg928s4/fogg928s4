#include <stdio.h>

int main() {
	printf("\x1b[2J");
	int size = 6;
	for(int i = 1; i <= size; i++) {
		for(int j = 1; j <= size - i; j++) 
			printf(" ");
		for(int k = 1; k <= 2*i -1;k++)
			printf("$");
		printf("\n");
	}
	return 0;
}

