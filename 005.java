//递归
public class Solution {
  ArrayList<Integer> arrayList = new ArrayList<Integer>;
  public ArrayList<Integer> printListFromTailToHead(ListNode listNode){
    if(listNode != null){
      this.printListFromTailToHead(listNode.next);
      arrayList.add(listNode.val);
    }
    return arrayList;
  }
}


//利用栈的先进后出
public class Solution{
  public ArrayList<Integer> printListFromTailToHead(ListNode listNode){
    if(listNode == null){
      ArrayList list = new ArrayList();
      return list;
    }

    Stack<Integer> stk = new Stack<Integer>();
    while(listNode != null){
      stk.push(listNode.val);
      listNode = listNode.next;
    }
    ArrayList<Integer> arr = new ArrayList<Integer>();
    while(!stk.isEmpty()){
      arr.add(stk.pop());
    }
    return arr;
  }
}
