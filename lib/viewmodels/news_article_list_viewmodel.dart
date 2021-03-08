import 'package:flutter/material.dart';
import 'package:news/models/news_article.dart';
import 'package:news/services/web_service.dart';
import 'package:news/viewmodels/news_article_viewmodel.dart';

class NewsArticleListViewModel extends ChangeNotifier {
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  Future<void> populateTopHeadlines() async => await _search(
    WebService().fetchTopHeadlines
  );

  Future<void> searchHeadlines(String keyword) async => _search(
    () => WebService().fetchHeadlinesByKeyword(keyword)
  );

  Future<void> _search(Future<List<NewsArticle>> Function() builder) async {
    List<NewsArticle> newsArticles = await builder();
    articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();
    notifyListeners();
  }
}