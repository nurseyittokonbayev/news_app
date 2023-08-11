import 'package:flutter/material.dart';
import 'package:news_app/core/dio_settings.dart';
import 'package:news_app/models/news_models.dart';
import 'package:news_app/services/fetch_service.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  NewsModels? news;

  Future<void> fetchedNews() async {
    news = await NewsService().fetchNews();
    setState(() {});
  }

  @override
  void initState() {
    fetchedNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: news == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Text(news!.status.toString()));
  }
}
