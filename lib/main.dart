import 'package:flutter/material.dart';
import 'package:news/viewmodels/news_article_list_viewmodel.dart';
import 'package:news/views/pages/news_list_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News',
      home: ChangeNotifierProvider(
        create: (_) => NewsArticleListViewModel(),
        child: NewsListPage(),
      ),
    );
  }
}
