void main(){
  var list = const[1,2];
  print(list.toString());
//    list.add(3);
  list = [3,4];
  print(list.toString());

  for(var i in list){
    print(i);
  }
  for(var i = 0; i < list.length;i++){
    print(list[i]);
  }

  Object object = "ssss";
  object.toString();

  dynamic obj = "ssss";
  if(obj is List){
    obj[0]=4;
  }



}
