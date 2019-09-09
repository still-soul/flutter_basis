import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_app/bean/android_item.dart';

class WebViewPage extends StatefulWidget {
  final AndroidItem androidItem;

  WebViewPage(this.androidItem);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
  }

  void dispose() async {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: AppBar(
        title: Text(widget.androidItem.desc),

      ),
      withLocalStorage: true,
      url: widget.androidItem.url,
      withJavascript: true,
    );
  }
}
