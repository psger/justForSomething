#include <iostream>
#include <vector>
//找单链表的倒数地N个数
using namespace std;

class Solution{
public:
  ListNode * FindLastN(ListNode * pListHead,unsigled int n)
  {
    if(pListHead == null)
    {
      return NULL;
    }
    int i = 0;
    ListNode *right = pListHead;
//第一个指针向前走n步
    while(i<n && right != NULL)
    {
      right = right->next;
      i++;
    }
//链表的长度小于n
    if(right == NULL & i<k)
    {
      cout << "链表长度小于n";
      return NULL;
    }
//右指针已经走了k步，此时左指针开始和右指针一起走，当有指针为空的时候，此时左指针就是倒数第n的数
    ListNode *left = pListHead;
    while(right != NULL)
    {
      left = left->next;
      right = right->next;
    }
    return left;
  }
}
