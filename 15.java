public class ListNode
{
  int val ;
  ListNode next = NULL;

  ListNode(int val){
    this.val = val;
  }
}

public Solution{
  public ListNode FindLastN(ListNode head,int k){
    if(head == null || k<0)
    return null;

    ListNode pre = head;
    ListNode last = head;
    // int i = 1;
    // while(pre!=null && i<= k){
    //   pre = pre->next;
    //   i++;
    // }
 
//pre先走k步
    for(int i = 1; i<=k;i++){
      if(pre != null){
        pre = pre->next;
      }else{
        return null;
      }

      while(pre != null){
        pre = pre->next；
        last = last->next;
      }
    return last;
    }
  }
}
