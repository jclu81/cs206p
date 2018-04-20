#include <iostream>
#include <iomanip>
extern "C" {
#include <quadmath.h>
}
using namespace std;
template <class T>
T cal (string type_name) {

    int i = 0,  mantissa_bit = 0;
    T eps=1, temp=1, min=1, max=1;
    //calculate eps
    while(1+temp!=1){
        mantissa_bit++;
        eps=temp;
        temp/=2;
    }
    mantissa_bit--;
    //calculate min_float
    temp=1;
    while(temp!=0){

        min=temp;
        temp/=2;
    }
    //calculate max
    temp = 1;
    while(temp!=temp/2){
        max = temp;
        //temp *=(2-eps);
        temp *=2;
    }
    max = max*(2-eps);
    cout<<"c++\t";
    cout<< type_name<<"\t";
    cout<< sizeof(T)<<"\t";
    cout<< mantissa_bit<<"\t";
    cout.precision(6);
    cout << std::scientific << eps << "\t";
    cout << std::scientific << min << "\t";
    cout << std::scientific << max << "\t";

//    std::cout<<std::numeric_limits<T>::epsilon()<<std::endl;
//    std::cout<<std::numeric_limits<T>::denorm_min()<<std::endl;
//    std::cout<<std::numeric_limits<T>::max()<<std::endl;

    return 0;
}
int main() {
    // std::cout << std::numeric_limits<long double>::digits10 << std::endl;
    cal<float>("float");
    cout<<endl;
    cal<double>("double");
    cout<<endl;
    cal<long double>("long double");
    cout<<endl;

    char temp_char[128];
    int i = 0,  mantissa_bit = 0;
    __float128 eps=1, temp=1, min=1, max=1;
    //calculate eps
    while(1+temp!=1){
        mantissa_bit++;
        eps=temp;
        temp/=2;
    }
    mantissa_bit--;
    //calculate min_float
    temp=1;
    while(temp!=0){

        min=temp;
        temp/=2;
    }
    //calculate max
    temp = 1;
    while(temp!=temp/2){
        max = temp;
        //temp *=(2-eps);
        temp *=2;
    }
    max = max*(2-eps);

    cout<<"c++\t";
    cout<< "float128"<<"\t";
    cout<< sizeof(__float128)<<"\t";
    cout<< mantissa_bit<<"\t";

    quadmath_snprintf(temp_char, sizeof(temp_char), "%.7Qg", 6, eps);
    cout<<temp_char<<"\t";
    quadmath_snprintf(temp_char, sizeof(temp_char), "%.7Qg", 6, min);
    cout<<temp_char<<"\t";
    quadmath_snprintf(temp_char, sizeof(temp_char), "%.7Qg", 6, max);
    cout<<temp_char<<"\t";

    return 0;
}


