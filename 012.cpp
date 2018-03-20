//打印从1到N位的最大数
//例如输入n = 2 那么打印1-99
//1<= N <= 5
#include <iostream>
#include <cmath>
using namespace std;

class Solution{
public:
  void print(int n){
    if(n>5 || n<1){
      std::cout << "请输入正确范围的数字" << '\n';
    }
    int max = pow(10,n);
    for(int i = 0;i<max;i++)
      cout << i <<endl;
  }
};

int main(){
  Solution solu;
  int n;
  while(cin >> n){
    solu.print(n);
  }
  return 0;
}
