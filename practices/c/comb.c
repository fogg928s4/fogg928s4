#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct fileInfo {
	char *fileName;
 	char *ext;
};


int main(int argc,char *argv[]) {
	char arguments[argc] = argv;

	printf("%s",arguments);
	return 0;
}
