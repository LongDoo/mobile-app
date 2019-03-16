class News {
  final int id;
  final String title, imgUrl, date, content;
  final List tag;

  News({this.id, this.title, this.imgUrl, this.date, this.content, this.tag});

  factory News.fromJson(Map<String, dynamic> json) {
    final content = json['content'];
    return News(
      id: json['id'] as int,
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
      date: json['date'] as String,
      content: "https://raw.githubusercontent.com/LongDoo/mockdb/master/markdown/$content"
    );
  }
}