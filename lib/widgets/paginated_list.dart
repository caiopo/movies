import 'package:flutter/material.dart';
import 'package:movies/api/paginator.dart';

class PaginatedList extends StatefulWidget {
  final IndexedWidgetBuilder builder;
  final Paginator paginator;
  final Axis scrollDirection;
  final EdgeInsets padding;

  const PaginatedList({
    Key key,
    this.builder,
    this.paginator,
    this.scrollDirection = Axis.vertical,
    this.padding,
  }) : super(key: key);

  @override
  _PaginatedListState createState() => _PaginatedListState();
}

class _PaginatedListState extends State<PaginatedList> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    final diff =
        _scrollController.position.maxScrollExtent - _scrollController.offset;

    if (diff < 300) {
      widget.paginator.loadNextPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: widget.builder,
      itemCount: widget.paginator.items.length,
      padding: widget.padding,
      scrollDirection: widget.scrollDirection,
    );
  }
}
