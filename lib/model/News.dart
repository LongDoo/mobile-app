class News {
  final int id;
  final String title, imgUrl, date, content;
  final List tags;

  News({this.id, this.title, this.imgUrl, this.date, this.content, this.tags});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'] as int,
      title: json['title'] as String,
      imgUrl: json['imgUrl'] as String,
      date: json['date'] as String,
      content: json['content'] as String,
      tags: json['tags'] as List
    );
  }
}