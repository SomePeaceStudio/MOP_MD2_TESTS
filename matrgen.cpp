#include <iostream>
#include <fstream>
#include <cstdlib>
#include <ctime>
using namespace std;

int main()
{
    int h1 = 0;
    int w1 = 0; // w1, h2 Jābūt vienādiem, lai varētu sareizināt
    int h2 = 0;
    int w2 = 0;
    int rnd;
    int min = -50; // min un max vērtības priekš matricu ģenerēšanas
    int max = 50;

    ofstream fout("infile.txt");
    cout<<"*******************************************************************"<<endl;
    cout<< "Faila \"infile.txt\" tiks generetas divas matricas ar izmeriem h1, w1 un h2, w2!";
    cout<< "Parametriem w1 un h2 jabut vienadiem, lai matricas butu sareizinamas!"<<endl;
    cout<<"*******************************************************************"<<endl;
    cout<< "Ievadi h1: "<<endl;
    cin>>h1;
    cout<< "Ievadi w1: "<<endl;
    cin>>w1;
    cout<< "Ievadi h2: "<<endl;
    cin>>h2;
    cout<< "Ievadi w2: "<<endl;
    cin>>w2;

    if(h1<1 || w1<1 || h2<1 || w2<1)
    {
        cout<< "Visiem parametriem jabut lielakiem par 0!"<<endl;
        cout<<"h1: "<<h1<<endl;
        cout<<"w1: "<<w1<<endl;
        cout<<"h2: "<<h2<<endl;
        cout<<"w2: "<<w2<<endl;
        return 0;
    }

    srand(time(NULL));

    fout << h1 <<" "<< w1 <<"\n";
    for(int i=0; i<h1; i++)
    {
        for(int i=0; i<w1; i++)
        {
            rnd = min + (rand() % (int)(max - min + 1));
            fout << rnd <<" ";
            if (i == w1-1)
            {
                fout << "\n";
            }
        }
    }

    fout << h2 <<" "<< w2 <<"\n";
    for(int i=0; i<h2; i++)
    {
        for(int i=0; i<w2; i++)
        {
            rnd = min + (rand() % (int)(max - min + 1));
            fout << rnd <<" ";
            if (i == w2-1)
            {
                fout << "\n";
            }
        }
    }

    cout<<"Failā \"infile.txt\" tika genereta matrica ar parametriem:"<<endl;
    cout<<"h1: "<<h1<<endl;
    cout<<"w1: "<<w1<<endl;
    cout<<"h2: "<<h2<<endl;
    cout<<"w2: "<<w2<<endl;

    return 0;
}
