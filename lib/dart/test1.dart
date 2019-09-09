void main() {
  int a = 1;
  double b = 1.11;
  bool isRight = true;
  String s = 'ss';
  var s1 = 'sss';

  var list = [1, 2];
  var list2 = List<int>();
  list2.add(1);
  list2.add(2);
  list2.add(3);

  for(var e in list2){
    print(e);
  }

  var set = Set<String>();
  set.add("11");
  set.add("22");

  var map = Map<String,int>();
  map['key1'] = 1;
  map['key2'] = 2;

  Object object = 'string';
  object = 1;
  object = false;
  print(object.toString());

  dynamic obj = 'string';

  dynamic o = <String,int>{};
  var map1 = o as Map<String,int>;



}
