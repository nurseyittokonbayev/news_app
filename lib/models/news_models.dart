import 'package:news_app/models/articles.dart';

class NewsModels {
  const NewsModels({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<Articles> articles;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'status': status,
      'totalResults': totalResults,
      'articles': articles.map((x) => x.toJson()).toList(),
    };
  }

  factory NewsModels.fromJson(Map<String, dynamic> json) {
    return NewsModels(
      status: json['status'] as String,
      totalResults: json['totalResults'] as int,
      articles: List<Articles>.from(
        (json['articles'] as List<dynamic>).map<Articles>(
          (x) => Articles.fromJson(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
