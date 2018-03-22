int blockSearch(SSTable ST,indexTble ID,KeyType kval)
{//在顺序表ST中分块查找其关键字等于给定值的数据元素，ID为索引表
  low = 0;high = ID.length - 1;found = false;
  if(kval > ID.elem[high].key)
  return 0;
  while(low<=high)//索引查找
  {
    mid = (low + high)/2;
    if(kval<ID.elem[mid].key)
      high = mid - 1;
    else if(kval>ID.elem[mid].key)
      low = mid +1;
      else {
        found = TRUE;
        low = mid;
      }
  }
  //索引查找后再在块中查找
  s = ID.elem[low].stadr;//定位到块的起始位置
  if(low<ID.length-1)
  t = ID.elem[low+1].stadr-1;
  else
  t = ST.length;
  if(ST.elem[t].key == kval)return t;
  else{
    ST.elem[0] = ST.elem[t];
    ST.elem[t].key = kval;
    for(k=s;)
  }

}
