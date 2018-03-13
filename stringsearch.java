public int search(String target,String pattern){
  if(pattern != null && target !=null && target.length()>=pattern.length()){
    int start = 0;
    int content = 0;
    while(target.length()-start<=pattern.length()){
      if(target.charAt(content+start) == pattern.charAt(content)){
        count++;
      }else{
        start++;
        content = 0;
      }
    }if(content== pattern.length()){
      return start;
      }
    }
  }
}
