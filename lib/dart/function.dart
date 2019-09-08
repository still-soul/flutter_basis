import 'package:meta/meta.dart';

void main(){
  print(fun());

  print(fun2(1));
  print(fun2(1,2));

  print(fun3(1));
  
  print(fun4(x:2, y: 3));
  print(fun4(y: 2,x: 3));

  print(fun5(x: 1));

  print(fun6(x:3,y: 4));

  var inside = newFun(3);
  print(inside(1,2));
}

//普通函数
int fun(){

  return 0;
}

//可选参数
int fun2(int x ,[int y]){
  //dart 里int的默认值为null
  if(y == null){
    return x;
  }else{
    return x + y;
  }

}

//默认参数
int fun3(int x, [int y = 1]){
  return x + y;
}

//具名参数  具名参数的特点是参数顺序可以任意
int fun4({int x, int y}){

  return x + y;
}

//具名参数也可以默认参数
int fun5({int x, int y =1}){

  return x+y;
}

//@required 注解表明是必填参数
int fun6({@required int x, @required int y}){

  return x + y;
}

// typedef 用于定义函数类型的别名
typedef Inside = int Function(int, int);

Inside newFun(int z){
  int inside(int x,int y){
    return x + y + z;
  }
  return inside;
}