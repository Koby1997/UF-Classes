#include <string.h>
#include <stdio.h>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <iostream>

using namespace std;

//helper function to convert public key in string format to RSA format
RSA* convertPublicKeyToRSA(FILE* fp, int length){
    RSA* r = NULL;
    RSA* x = PEM_read_RSA_PUBKEY(fp, &r, NULL, NULL);	
    return r;
}

int main()
{
    char inbug[2048]



	// 1. Open the named pipe in read only mode
    int p1[2];
    if(pipe(p1) == -1)
	{
		cout<<"failed to create pipe"<<endl;
		return 0;
	}
    close(p1[1]); //only reading
   
 	// 2. Read the public key of the receiver from the pipe
    char publicKey[];


    // 3. Close the pipe

    // 4. Display the received public key

    // 5. Input a message from the user using standard input
	
	// 6. Convert the public key of the receiver from string in to RSA strucure format
	
	// 7. Encrypt the message using the RSA public encryption API
	
	// 8. Display the encrypted message
		
    // 9. Open the named pipe in write only mode

    // 10. Write the encrypted message to the pipe 
	
	// 11. Close the pipe
     	
	// 12. Free memory used.
	
}
	
