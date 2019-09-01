void main(){

  var test = new Test(1, 2);
  var test2 = new Test2(1,2,3);

}

class Test {
  int x;
  int y;

  Test(int x, int y) {
    this.x = x;
    this.y = y;
  }

}


class Test2 extends Test {
  int z;
  Test2(int x, int y,int z) : z = z,super(x, y){
    print(z);
  }

}
