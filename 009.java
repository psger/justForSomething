public class Solution {

  public static long Feibo(int n){
    if(n<2){
      return n;
    }

    long one = 0;
    long two = 1;
    long res = 0;
    for(int i=2;i <= n; i++){
       res = one + two;
       one = two;
       two = res;
    }
    return res;
  }


  public static long FeiboDigui(int n){
    if(n<2){
      return n;
    }
    return FeiboDigui(n-1) + FeiboDigui(n-2);
  }
}
