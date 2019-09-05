import 'package:flutter/material.dart';

class AnimTest extends StatelessWidget {
  AnimTest();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: AnimWidget(
        mContext: context,
      ),
    );
  }
}

class AnimWidget extends StatefulWidget {
  BuildContext mContext;

  AnimWidget({this.mContext});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AnimState(buildContext: mContext);
  }
}

class _AnimState extends State<AnimWidget> with SingleTickerProviderStateMixin {
  //动画控制器
  var controller;
  BuildContext buildContext;

  _AnimState({this.buildContext});

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        //时长
        duration: Duration(milliseconds: 5000));
    // 调用 forward 方法开始动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('动画'),
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(buildContext)),
          ),
          body: Container(
              alignment: Alignment.center,
              child: ScaleTransition(
                  scale: controller, child: FlutterLogo(size: 100))),
        );

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }
}
