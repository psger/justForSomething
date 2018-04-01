//题目描述
//输入两个单调递增的链表，输出两个链表合成后的链表，当然我们需要合成后的链表满足单调不减规则。
//样例输入
//1 3 5 7 9 2 4
//样例输出
//1 2 3 4 5 7 9
//递归实现

class Solution{
public:
  ListNode* Merge(ListNode *pLeft,ListNode *pRight)
  {
    if(pLeft == NULL){
      std::cout << "left is null" << '\n';
    }
    return pRight;
    else if(pRight == NULL){
      std::cout << "right is null" << '\n';
    }
    return pLeft;

    ListNode *head = NULL;
    if(pLeft->val < pRight->val){
      head = pLeft;
      head->next = Merge(pLeft->next,pRight);
    }
    else
    {
      head = pRight;
      head->next = Merge(pleft,pRight->next);
    }
    return head;
  }
}
