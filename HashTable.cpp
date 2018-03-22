#include<stdio.h>
#define DataType int
#define Len 20

typedef struct HashNode
{
  DataType data;//存储值
  int isNull;//标志该位置是否被填充
}HashTable;

HashTable hashTable[Len];

void initHashTable()
{
  int i;
  for(i=0;i<Len;i++)
  {
    hashTable[i].isNull = 1;//初始状态为空
  }
}

int getHashAddress(DataType key)//哈希函数
{
  return key *3 % 7;
}

int insert(DataType key)
{
  int address = getHashAddress(key);//通过哈希函数计算哈希值
  if(hashTable[address].isnull == 1){//判断计算得到的地址是否被占
    hashTable[address].data = key;//存储值
    hashTable[address].isnull = 0;//存储后将位置置为已占
  }
  else    //当发生冲突的时候
    {
        while(hashTable[address].isNull == 0 && address<Len)
        {
            address++;          //采用线性探测法，步长为1
        }
        if(address == Len)      //Hash表发生溢出
            return -1;
        hashTable[address].data = key;
        hashTable[address].isNull = 0;
    }
  return 0;
}


int find(DataType key){
  int address = getHashAddress(key);
  while(!(hashTable[address].isnull == 0 && hashTable[address].data == key && address <Len))
  {
    address++;
  }
  if(address == Len){
    address = -1;
  }
  return address;
}



int main(int argc, char *argv[])
{
    int key[]={7,8,30,11,18,9,14};
    int i;
    initHashTable();
    for(i = 0; i<7; i++)
    {
        insert(key[i]);
    }
    for(i = 0; i<7; i++)
    {
        int address;
        address = find(key[i]);
        printf("key:%d\t address:%d\n", key[i],address);
    }

    return 0;
}
