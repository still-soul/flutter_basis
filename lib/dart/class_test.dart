void main(){

  var test = new Test(1, 2);
  var test2 = new Test2(2, 3);
  var test3 = new Test3(1,2,3);

}

class Test {
  int x;
  int y;

  Test(int x, int y) {
    this.x = x;
    this.y = y;
  }

}

class Test2{
  int x;
  int y;
  Test2(this.x,this.y);
}


class Test3 extends Test {
  int z;
  Test3(int x, int y,int z) : z = z,super(x, y){
    print(z);
  }

}
