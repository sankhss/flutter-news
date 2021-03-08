class APIPaths {
  static final _apiKey = '141384f115144781bfcc6aea512d87f7';
  static final _apiBaseUrl = 'https://newsapi.org/v2';

  static String topHeadlines({String country = 'br'}) => '$_apiBaseUrl/top-headlines?country=$country&apiKey=$_apiKey';
  static String headlinesFor(String keyword) => '$_apiBaseUrl/everything?q=$keyword&apiKey=$_apiKey';
}