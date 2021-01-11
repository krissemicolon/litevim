#include <stdio.h>
#include <dirent.h>

int main() {
  DIR *dp;
  struct dirent *ep;     
  dp = opendir ("./");

  if(dp != NULL) {
    while ((ep = readdir (dp)))
      puts (ep->d_name);

    (void) closedir (dp);
  }else
    perror ("Couldn't open the directory");

  return 0;
}
