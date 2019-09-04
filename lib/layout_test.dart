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

class LayoutState extends State<LayoutTest>
    with WidgetsBindingObserver{
  //插入渲染树的时候调用，只调用一次
  @override
  void initState() {
    print('插入渲染树');
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }
  //state依赖的对象发生变化时调用
  @override
  void didChangeDependencies() {
    print('state依赖的对象发生变化');
    super.didChangeDependencies();
  }
  //组件状态改变时候调用
  @override
  void didUpdateWidget(LayoutTest oldWidget) {
    print('组件状态改变');
    super.didUpdateWidget(oldWidget);
  }
  //构建widget时调用
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
              ),
              //水平布局
              new Row(
                children: <Widget>[
                  //除其他控件外占满一行
                  Expanded(
                      flex: 2,
                      child: RaisedButton(
                          onPressed: null,
                          child: Text('tv1'))),
                  Expanded(
                      flex: 1,
                      child: RaisedButton(onPressed: null, child: Text('tv2')))
                ],
              ),

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

  //当移除渲染树的时候调用
  @override
  void deactivate() {
    print('移除渲染树');
    super.deactivate();
  }
  //组件即将销毁时调用
  @override
  void dispose() {
    print('组件即将销毁');
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.inactive:
        print('AppLifecycleState.inactive');
        break;
      case AppLifecycleState.resumed:
        print('AppLifecycleState.resumed');
        break;
      case AppLifecycleState.paused:
        print('AppLifecycleState.paused');
        break;
      case AppLifecycleState.suspending:
        print('AppLifecycleState.suspending');
        break;
    }

  }

}
