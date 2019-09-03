import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  Layout();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new LayoutTest(),
    );
  }
}

var isVisible = false;
var stringValue = '隐藏';

class LayoutTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LayoutState();
  }
}

class LayoutState extends State<LayoutTest> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(title: new Text('基本布局')),
        body: new Container(
          //垂直布局
          child: Column(
            children: <Widget>[
              new Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Flexible(
                      //权重,按比例设置
                      flex: 2,
                      //对基本组价进行了封装，类似viewGroup
                      child: new Container(
                        height: 120.0,
                        color: Colors.pink,
                        child: const Center(
                          child: const Text('left'),
                        ),
                      )),
                  new Flexible(
                      flex: 1,
                      child: new Container(
                        height: 120.0,
                        color: Colors.blue,
                        child: const Center(
                          child: const Text('middle'),
                        ),
                      )),
                  new Flexible(
                      flex: 1,
                      child: new Container(
                        height: 120.0,
                        color: Colors.orange,
                        child: const Center(
                          child: const Text('right'),
                        ),
                      )),
                ],
              ),
              //叠层布局
              new Stack(
                children: <Widget>[
                  new Container(
                    width: 300,
                    height: 120,
                    color: Colors.green,
                  ),
                  new Positioned(
                      left: 100,
                      right: 100,
                      child: new Container(
                        color: Colors.blue,
                        width: 100,
                        height: 100,
                        child: FlatButton(
                            onPressed: click, child: Text(stringValue)),
                      )),
                  new Offstage(
                    //offstage属性为true时隐藏
                    offstage: isVisible,
                    child: new Container(
                      width: 100,
                      height: 100,
                      color: Colors.black,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }

  //点击操作
  void click() {
    //调用setState()来重新绘制
    setState(() {
      isVisible = !isVisible;
      if (isVisible) {
        stringValue = "显示";
      } else {
        stringValue = "隐藏";
      }
    });
  }
}
