import 'package:flutter/material.dart';


class Layout extends StatelessWidget {
  Layout();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: '基本布局',
      home: new LayoutTest(),
    );
  }

}

class LayoutTest extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LayoutState();
  }

}
class LayoutState extends State<LayoutTest>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new Text("sss"),
    );
  }

}