class AndroidItem {
  String createdAt;
  String desc;
  List<String> images;
  String publishedAt;
  String source;
  String type;
  String url;
  bool used;
  String who;

  AndroidItem({
      this.createdAt,
      this.desc,
      this.images,
      this.publishedAt,
      this.source,
      this.type,
      this.url,
      this.used,
      this.who});


  @override
  String toString() {
    return 'AndroidItem{createdAt: $createdAt, desc: $desc, images: $images, publishedAt: $publishedAt, source: $source, type: $type, url: $url, used: $used, who: $who}';
  }

  factory AndroidItem.fromJson(Map<String, dynamic> json){
    return AndroidItem(
      createdAt: json['createdAt'],
      desc: json['desc'],
      images: json['images']?.map<String>((image) => image as String)?.toList() ?? [] ,
      publishedAt: json['publishedAt'],
      source: json['source'],
      type: json['type'],
      url: json['url'],
      used: json['used'],
      who: json['who'],
    );
  }
}
