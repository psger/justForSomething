/*
利用栈实现二进制转十进制
*/

public class solution{
  public void toTen(int n){
    int i = n.length();
    int sum = 0;
    int par = 0;
    int e = 0;
    Stack<Integer> s1 = new Stack<Integer>();
    while（j<i){
      s.push(n.CharAt(j));
      j++;
    }
    while(!s.isEmpty()){
        e = s.pop();
        sum += e*(2^i);
        i++;
    }
    return sum;
  }
}
