import 'package:flutter/material.dart';

class SearchNewsWidget extends StatefulWidget {
  final Function(String) onSearch;
  final Function onClear;

  const SearchNewsWidget({Key key, @required this.onSearch, this.onClear})
      : super(key: key);

  @override
  _SearchNewsWidgetState createState() => _SearchNewsWidgetState();
}

class _SearchNewsWidgetState extends State<SearchNewsWidget> {
  final _searchController = TextEditingController();
  final _focusNode = FocusNode();
  bool _inSearch = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        focusNode: _focusNode,
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            widget.onSearch(value);
            setState(() => _inSearch = true);
          }
        },
        decoration: InputDecoration(
          labelText: 'Search',
          prefixIcon: Icon(Icons.search),
          suffixIcon: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              _focusNode.unfocus();
              _focusNode.canRequestFocus = false;
              _searchController.clear();
              if (widget.onClear != null && _inSearch) {
                widget.onClear();
                setState(() => _inSearch = false);
              }
              Future.delayed(Duration(milliseconds: 10), () {
                _focusNode.canRequestFocus = true;
              });
            },
          ),
        ),
      ),
    );
  }
}
