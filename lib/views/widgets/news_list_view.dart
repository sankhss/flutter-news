import 'package:flutter/material.dart';
import 'package:news/viewmodels/news_article_viewmodel.dart';
import 'package:news/views/widgets/news_article_tile.dart';

class NewsListView extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  const NewsListView(this.articles, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (ctx, i) => NewsArticleTile(articles[i]),
      );
  }
}