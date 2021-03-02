#include <thread>
#include <iostream>
#include <vector>

using namespace std;

void randomNumber(int ID, int count)
{
    if(count > 9999)
    {
        cout << "Error: argument is over 9999." << endl;
        return;
    }

    int check = rand() % 10000;
    while(check != count)
        check = rand() % 10000;

    cout << "Thread " << ID << " completed." << endl;
    return;
}

int main(int argc, char *argv[])
{
    int count = atoi(argv[1]);

    vector<thread> threads;

    for(int i = 0; i < 10; i++)
        threads.push_back(thread(randomNumber, i, count));


    for (auto& t : threads)
        t.join();

    cout << "All threads have finished finding numbers." << endl;

    return 0;
}