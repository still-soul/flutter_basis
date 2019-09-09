import 'package:flutter/material.dart';
import 'package:flutter_app/utils/date_util.dart';
import 'package:flutter_app/bean/android_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'gallery.dart';
import 'web_view.dart';

class AndroidListItem extends StatefulWidget {
  final AndroidItem androidItem;

  AndroidListItem(this.androidItem);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AndroidListState();
  }
}

class _AndroidListState extends State<AndroidListItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(//手势控件
      onTap: () {//点击事件
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return WebViewPage(widget.androidItem);
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).canvasColor,
            border: Border(
              bottom:
              BorderSide(width: 0.0, color: Theme.of(context).dividerColor),
            )),
        child: IntrinsicHeight(
          child: Row(
            //水平布局
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: _androidListItemWidget(context),
          ),
        ),
      ),
    );
  }

  List<Widget> _androidListItemWidget(BuildContext context) {
    var contentWidgets = <Widget>[
      //占满一行
      Expanded(
        child: Column(//纵向布局
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(16),//边距
              child: Text(
                widget.androidItem.desc,
                maxLines: 3, //限制最多显示三行
                overflow: TextOverflow.ellipsis,//超出文字在句末...
                style: Theme.of(context).textTheme.body1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, bottom: 16),//边距，针对某个方向的
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text('作者：' + widget.androidItem.who,
                      maxLines: 1, style: Theme.of(context).textTheme.body2),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                        formatDateStr(widget.androidItem.createdAt),
                        maxLines: 1,
                        style: Theme.of(context).textTheme.body2),
                  )
                ],
              ),
            )
          ],
        ),
      )
    ];
    if(widget.androidItem.images != null && widget.androidItem.images.isNotEmpty){
      //如果缩略图不为空，添加缩略图
      contentWidgets.add(
          GestureDetector(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return GalleryPage(widget.androidItem.images, widget.androidItem.desc);
              }));
            },
            child: Container(
              margin: EdgeInsets.only(right:16 ,top: 20,bottom: 20),
              width: 80,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(//网络图片加载
                        widget.androidItem.images[0].replaceAll("large", "thumbnail")
                    ),
                  )
              ),
            ),
          )
      );
    }
    return contentWidgets;
  }
}
