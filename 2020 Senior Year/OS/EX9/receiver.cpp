#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <iostream>
#include <fstream>
#include <streambuf>
#include <cstring>
#include <openssl/rsa.h>
#include <openssl/pem.h>
#include <openssl/err.h>

using namespace std;

// reads the key from the file
char* readKey(string fileName){
	ifstream file(fileName.c_str());
	string contents((istreambuf_iterator<char>(file)), istreambuf_iterator<char>());
	char* key = (char*)malloc(strlen(contents.c_str()) * sizeof(char) + 1);
	strcpy(key, (char*)contents.c_str());
	file.close();
	return key;
}

//helper function to convert private key in string format to RSA format
RSA* convertPrivateKeyToRSA(FILE* fp, int length) {
	RSA* p_key = NULL;
	RSA* x = PEM_read_RSAPrivateKey(fp, &p_key, NULL, NULL);
	return p_key; 
}

//helper function to convert public key in string format to RSA format
RSA* convertPublicKeyToRSA(FILE* fp, int length) {
	RSA* publicKey = NULL;
	RSA* temp = PEM_read_RSA_PUBKEY(fp, &publicKey, NULL, NULL);
	return publicKey;
}

int main()
{
	// 1. Read the keys
	char* publicKey = readKey(publicKey.txt);
	char* privateKey = readKey(privateKey.txt);
	
	//2. Display the keys
	cout<<publicKey<<endl;
	cout<<privateKey<<endl;
	
	// 3. Open the named pipe in write only mode
	int p1[2];
	if(pipe(p1) == -1)
	{
		cout<<"failed to create pipe"<<endl;
		return 0;
	}
	close(p1[0]); //only writing
	
	// 4. Write the public key to the pipe and close the pipe
	write(p1[1], &publicKey, sizeof(publicKey));
	close(p1[1]);
	
	// 5. Convert the public key in string format to RSA format


	// 6. Open the pipe again in read only mode
	if(pipe(p1) == -1)
	{
		cout<<"failed to create pipe"<<endl;
		return 0;
	}
	close(p1[1]); //only reading

	// 7. Read the incoming message length and the incoming message
	read(p1[0], );
	
	// 8. Close the pipe
	close(p1[0]);

	// 9. Display the received encrypted message
	
	// 10. Decrypt the message using RSA private decryption API
	
    // 11. Display the decrypted message
        
	// 12. Free memory used	
}
