import 'package:news_app/models/source.dart';

class Articles {
  const Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final Source source;
  final String author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'source': source.toJson(),
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }

  factory Articles.fromJson(Map<String, dynamic> map) {
    return Articles(
      source: Source.fromJson(map['source'] as Map<String, dynamic>),
      author: map['author'] as String,
      title: map['title'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      url: map['url'] as String,
      urlToImage:
          map['urlToImage'] != null ? map['urlToImage'] as String : null,
      publishedAt: map['publishedAt'] as String,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }
}
