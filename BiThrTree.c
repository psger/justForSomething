#include <stdio.h>
#include <stdlib.h>

typedef char ElemType;


typedef enum {Link,Thread} PointerTag

typedef struct BiThrNode
{
  char data;
  struct BiThrNode *lchild,*rchild;
  PointerTag ltag;
  PointerTag rtag;
}BiThrNode,*BiThrTree;


//前序遍历创建一颗二叉树
CreateBiThrTree(BiThrTree *T){
  char c;
  scanf("%c",&c);
  if(' ' == c){
    *T = null;
  }
  else{
    *T = (BiThrNode *)malloc(sizeof(BiThrNode));
    (*T)->data = c;
    (*T)->ltag = Link;
    (*T)->rtag = Link;

    CreateBiThrTree(&(*T)->lchild);
    CreateBiThrTree(&(*T)->rchild);
  }
}
