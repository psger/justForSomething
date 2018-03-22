int Search_Bin(SSTable ST,KeyType kval)
{//有序表ST中折半查找其关键字等于kval的数据元素
  low = 1;hight = ST.length;
  while(low<=hight){
    mid = (low + hight)/2;
    if(kval == ST.elem[mid].key)
    return mid;
    else
    if(kval < ST.elem[mid].key)
    hight = mid-1;
    else
    mid = mid+1;
  }
  return 0;
}
