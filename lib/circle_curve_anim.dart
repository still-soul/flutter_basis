import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircleCurveView extends StatelessWidget {
  CircleCurveView();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: CircleCurveWidget(
        mContext: context,
      ),
    );
  }
}

class CircleCurveWidget extends StatefulWidget {
  BuildContext mContext;

  CircleCurveWidget({this.mContext});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CircleCurveState(buildContext: mContext);
  }
}

class _CircleCurveState extends State<CircleCurveWidget>
    with SingleTickerProviderStateMixin {
  //动画控制器
  var controller;
  static const padding = 20.0;
  Animation<double> left;
  Animation<Color> colors;
  BuildContext buildContext;

  _CircleCurveState({this.buildContext});

  @override
  void initState() {
    super.initState();
    Future(_initAnim);
  }

  void _initAnim() {
    controller = AnimationController(
        vsync: this,
        //时长
        duration: Duration(milliseconds: 5000));
    //获取屏幕宽度
    final mediaQueryData = MediaQuery.of(context);
    final displayWidth = mediaQueryData.size.width;
    //开始和结束颜色
    colors =
        ColorTween(begin: Colors.green, end: Colors.purple).animate(controller);
    left =
        Tween(begin: padding, end: displayWidth - padding).animate(controller)
          ..addListener(() {
            //触发重绘
            setState(() {});
          })
          //动画状态变化监听
          ..addStatusListener((status) {
            //动画完成时
            if (status == AnimationStatus.completed) {
              //让动画反着再执行一遍
              controller.reverse();
              //反着执行结束
            } else if (status == AnimationStatus.dismissed) {
              // 调用 forward 方法开始动画
              controller.forward();
            }
          });
    // 调用 forward 方法开始动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final unit = 20.0;
    final marginLeft = left == null ? padding : left.value;
    final color = this.colors == null ? Colors.green : colors.value;

    final unitLeft = (marginLeft - padding) / unit;
    //正弦位置 [-1,1]
    final unitTop = math.sin(unitLeft);
    final marginTop = (unitTop + 1) * unit + padding;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('圆点曲线动画'),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(buildContext)),
      ),
      body: Container(
        //根据动画进度设置圆的位置
        margin: EdgeInsets.only(left: marginLeft, top: marginTop),
        child: Container(
          //圆点
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(8.0)),
          width: 15.0,
          height: 15.0,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
