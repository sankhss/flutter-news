class NewsArticle {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;

  NewsArticle({
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }
  
}
