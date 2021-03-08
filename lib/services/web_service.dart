import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/models/news_article.dart';
import 'package:news/utils/api_paths.dart';

class WebService {
  Future<List<NewsArticle>> fetchTopHeadlines() async => _getNews(APIPaths.topHeadlines());

  Future<List<NewsArticle>> fetchHeadlinesByKeyword(String keyword) async => _getNews(APIPaths.headlinesFor(keyword));

  Future<List<NewsArticle>> _getNews(String path) async {
    final response = await http.get(path);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable articles = result['articles'];
      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to fetch news.');
    }
  }
}
