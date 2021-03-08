import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:news/viewmodels/news_article_viewmodel.dart';

class NewsArticleDetailPage extends StatelessWidget {
  final NewsArticleViewModel article;

  const NewsArticleDetailPage(this.article, {Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.title),
      ),
      body: WebView(
        initialUrl: article.url,
      ),
    );
  }
}
