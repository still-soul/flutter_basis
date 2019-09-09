import 'package:flutter/material.dart';
import 'package:flutter_app/http/http_util.dart';
import 'package:flutter_app/bean/android_item.dart';
import 'package:flutter_app/listview/list_item _view.dart';



class ListViewPage extends StatefulWidget {
  ListViewPage();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ListViewState();
  }

}

class _ListViewState extends State<ListViewPage>{
  var responseList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListData({});
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView.builder(
              itemCount: responseList.length,
              itemBuilder:(context,index){
                AndroidItem androidItem = new AndroidItem.fromJson(responseList[index]);
                return AndroidListItem(androidItem);
              } )
      ),
    );

  }

  Future<Map> getListData([Map<String, dynamic> params]) async {
    const androidUrl = 'http://gank.io/api/data/Android/20/4';
    var response = await HttpUtil.get(androidUrl);

    setState(() {
      responseList = response['results'];
    });

  }
}






