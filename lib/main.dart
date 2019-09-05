import 'package:flutter/material.dart';
import 'main2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Welcome to Flutter',
      home: MyPage()

    );
  }
}

class MyPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new MainState ();
  }
}

class MainState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome to Flutter'),
      ),
      body: new Center(
        child :GestureDetector(
          child: new Text('Hello World',
            style: new TextStyle(
              color: Colors.blue,
              fontSize: 26.0,
              fontWeight: FontWeight.bold,

            ),
          ),
          onTap:() async {
            var msg = await Navigator.push(context,MaterialPageRoute(builder: (context){
              return Main2State();
            }));
            debugPrint(msg);
          },
        ),

      ),
    );
  }
}




