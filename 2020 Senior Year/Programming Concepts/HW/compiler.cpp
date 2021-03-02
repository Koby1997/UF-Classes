#include <iostream>

using namespace std;

int main(int argc, char *argv[])
{
    int binary = atoi(argv[1]);
    int decimal = 0;

    int power_two = 1;

    while(binary != 0)
    {
        int a = binary;
        int b = binary - 1;

        if(b == 0)
            decimal = decimal + power_two;
        else if(a/10 == b/10)
            decimal = decimal + power_two;

        power_two = power_two * 2;
        binary = binary/10;
    }

    cout << "decimal number is: " << decimal << endl;

}