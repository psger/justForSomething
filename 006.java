public class Solution{
  Stack<Integer> s1 = new Stack<Integer>();
  Stack<Integer> s2 = new Stack<Integer>();


  public void push(int node){
      s1.push(node);
  }

  public void pop(){
    if(s1.isEmpty() && s2.isEmpty()){
      throw new RuntimeException("队列为空");
    }
    if(s2.isEmpty()){
      while(s1.isEmpty()){
        s2.push(s1.pop());
      }
      s2.pop();
    }
    return s2.pop();
  }
}
