import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:news_app/constants/api_const.dart';
import 'package:news_app/models/news_models.dart';

class NewsService {
  final client = Client();

  Future<NewsModels?> fetchNews() async {
    final url = Uri.parse(ApiConst.topNews);
    final responce = await client.get(url);

    if (responce.statusCode == 200 || responce.statusCode == 201) {
      final data = jsonDecode(responce.body);
      final news = NewsModels.fromJson(data);
      log(news.toString());

      return news;
    }
    return null;
  }
}
