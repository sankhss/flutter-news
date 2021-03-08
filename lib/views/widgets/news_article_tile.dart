import 'package:flutter/material.dart';
import 'package:news/viewmodels/news_article_viewmodel.dart';
import 'package:news/views/pages/news_article_detail_page.dart';

class NewsArticleTile extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsArticleTile(this.article, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => NewsArticleDetailPage(article),
        ),
      ),
      leading: Container(
        height: 100.0,
        width: 100.0,
        child: article.imageUrl != null
            ? FadeInImage.assetNetwork(
                image: article.imageUrl,
                placeholder: 'images/news-placeholder.png',
                imageErrorBuilder: (ctx, e, _) =>
                    Image.asset('images/news-placeholder.png'),
              )
            : Image.asset('images/news-placeholder.png'),
      ),
      title: Text(article.title),
    );
  }
}
