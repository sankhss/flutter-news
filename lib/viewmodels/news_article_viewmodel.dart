import 'package:news/models/news_article.dart';

class NewsArticleViewModel {
  NewsArticle _article;

  NewsArticleViewModel({NewsArticle article}): _article = article;

  String get title => _article.title;
  String get description => _article.description;
  String get url => _article.url;
  String get imageUrl => _article.urlToImage;
}