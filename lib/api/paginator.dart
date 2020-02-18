import 'package:flutter/cupertino.dart';
import 'package:movies/api/response.dart';

typedef LoadPage<T> = Future<Page<T>> Function(int page);

class Paginator<T> extends ChangeNotifier {
  final List<T> items = [];
  final LoadPage<T> _loader;

  int _nextPage = 1;
  bool _loading = false;
  bool _finished = false;

  bool get loading => _loading;

  bool get finished => _finished;

  Paginator(this._loader) {
    loadNextPage();
  }

  Future<void> loadNextPage() async {
    if (!_finished && !_loading) {
      _loading = true;
      notifyListeners();

      final pageIndex = _nextPage++;
      final page = await _loader(pageIndex);

      items.addAll(page.results);
      _finished = page.page == page.totalPages;
      _loading = false;
      notifyListeners();
    }
  }
}
