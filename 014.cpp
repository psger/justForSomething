#include <iostream>
#include < vector>

using namespace std;

class Solution{
public:
  void reOrderArray(vector<int>array)
  {
    if(array.size() <=1)
    reutrn 0;

    std::vector<int> tmp;
    vector<int>::iterator ib1;//声明一个迭代器，来访问vector容器，作用：遍历或者指向vector容器的元素
    ib1 = array.begin();

    for(;ib1 != array.end();){
      if(ib1 %2 == 0){
        tmp.push_back(ib1);
        array.earse(ib1);
        ib++;
      }else{
        ib1++;
      }
    }

    std::vector<int>::iterator ib2;
    ib2 = tmp.begin();
    for(;ib2!= tmp.end();ib2++)
    {
      array.push_back(ib2);
    }
  }
}

int main(){
  Solution solu;
}
