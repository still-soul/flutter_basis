import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'layout_test.dart';

class Main2State extends StatelessWidget {
  Main2State();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new MyWidget(mContext : context),
    );
  }
}

class MyWidget extends StatefulWidget {
  BuildContext mContext;
  MyWidget({this.mContext});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MyState(buildContext:mContext);
  }
}

class MyState extends State<MyWidget> {
  //文本输入控制器
  var editController = TextEditingController();
  BuildContext buildContext;
  MyState({this.buildContext});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.map), onPressed: _pushLayout),
          ],
          title: new Text('基础控件'),
        ),
        //滑动布局
        body: SingleChildScrollView(
          //对基本组价进行了封装，类似viewGroup
          child: new Container(
              margin: EdgeInsets.all(10.0),
              child: Center(
                //垂直布局
                child: new Column(
                  //交叉轴，主要用于column 和 row 布局中，管理子控件的位置
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      'text 的基本属性',
                      //文本对齐
                      textAlign: TextAlign.center,
                      //限制行数
                      maxLines: 1,
                      //溢出显示
                      overflow: TextOverflow.ellipsis,
                      style: new TextStyle(
                          //为false的时候不显示
                          inherit: true,
                          //颜色
                          color: Colors.black,
                          //大小
                          fontSize: 18.0,
                          //样式,这里是斜体
                          fontStyle: FontStyle.italic,
                          //字重，这里是加粗
                          fontWeight: FontWeight.bold,
                          //每个字符之间的间距
                          letterSpacing: 10.0,
                          //字间距、字句间距
//                        wordSpacing: 10.0,
                          //添加划线
                          decoration: TextDecoration.underline,
                          //划线样式
                          decorationStyle: TextDecorationStyle.solid),
                    ),
                    new FlatButton(
                        onPressed: () => showToast('点击了flatButton'),
//                        onPressed: () => Navigator.pop(buildContext,"返回信息"),
                        child: Text(
                          'button',
                          style: TextStyle(color: Colors.black, fontSize: 18.0),
                        )),
                    new RaisedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                //内容
                                content: Text("点击了RaisedButton"),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text("关闭"),
                                    //点击关闭
                                    onPressed: () => Navigator.of(context).pop(),
                                  )
                                ],
                              );
                            });
                      },
                      child: Text(
                        'button',
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                    ),
                    //加载网络图片
                    new Image.network(
                      'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4135477902,3355939884&fm=26&gp=0.jpg',
                      //大小
                      width: 300.0,
                      height: 200.0,
                      //显示方式
                      fit: BoxFit.contain,
                    ),
                    //加载本地图片
                    new Image.asset(
                      'images/im1.png',
                      width: 300.0,
                      height: 200.0,
                      fit: BoxFit.contain,
                    ),

                    new Image(
                        //图片的原始大小
                        image: new AssetImage('images/im1.png')),
                    //圆形图片
                    new CircleAvatar(
                      backgroundImage: new NetworkImage(
                          'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4135477902,3355939884&fm=26&gp=0.jpg'),
                      //半径越大图片越大
                      radius: 100.0,
                    ),
                    //设圆角图片
                    new Container(
                      width: 200.0,
                      height: 200.0,
                      margin: const EdgeInsets.all(20.0),
                      //是对Container进行装饰的描述。其概念类似与android中的shape
                      decoration: new BoxDecoration(
                        color: Colors.white,
                        image: new DecorationImage(
                            image: new NetworkImage(
                                'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=4135477902,3355939884&fm=26&gp=0.jpg'),
                            fit: BoxFit.cover),
                        shape: BoxShape.rectangle, // <-- 这里需要设置为 rectangle
                        borderRadius: new BorderRadius.all(
                          const Radius.circular(
                              20.0), // <-- rectangle 时，BorderRadius 才有效
                        ),
                      ),
                    ),
                    //文本输入框
                    new TextField(
                      controller: editController,
                    )
                  ],
                ),
              )),
        ));
  }

  @override
  void dispose() {
    //释放文本输入资源
    editController.dispose();
    super.dispose();
  }

  void _pushLayout() {
    Navigator.push(context,MaterialPageRoute(builder: (context) {
      return Layout();
    }));
  }
}

showToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      //内容
      toastLength: Toast.LENGTH_LONG,
      //时间长短
      gravity: ToastGravity.CENTER,
      //位置
      textColor: Colors.white,
      //字体颜色
      fontSize: 18.0,
      //字体大小
      backgroundColor: Colors.blue,
      //背景颜色
      timeInSecForIos: 1 //这里的展示时长，针对iOS有用
      );
}
