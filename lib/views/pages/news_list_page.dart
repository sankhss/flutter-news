import 'package:flutter/material.dart';
import 'package:news/viewmodels/news_article_list_viewmodel.dart';
import 'package:news/views/widgets/news_list_view.dart';
import 'package:news/views/widgets/search_news_widget.dart';
import 'package:provider/provider.dart';

class NewsListPage extends StatefulWidget {
  @override
  _NewsListPageState createState() => _NewsListPageState();
}

class _NewsListPageState extends State<NewsListPage> {
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchTopNews();
  }

  Future<void> _search(String keyword) async {
    setState(() => _isLoading = true);
    await Provider.of<NewsArticleListViewModel>(context, listen: false)
        .searchHeadlines(keyword);
    setState(() => _isLoading = false);
  }

  Future<void> _fetchTopNews() async {
    setState(() => _isLoading = true);
    await Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateTopHeadlines();
    setState(() => _isLoading = false);
  }

  Widget _buildList(NewsArticleListViewModel vm) {
    return _isLoading
        ? Center(child: CircularProgressIndicator())
        : vm.articles.isEmpty
            ? Center(child: Text('No results found.'))
            : NewsListView(vm.articles);
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Latest News'),
      ),
      body: Column(
        children: [
          SearchNewsWidget(onSearch: _search, onClear: _fetchTopNews),
          Expanded(child: _buildList(vm)),
        ],
      ),
    );
  }
}
