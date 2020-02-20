import 'package:flutter/cupertino.dart';
import 'package:movies/api/response.dart';

typedef LoadPage<T> = Future<Page<T>> Function(int page);

class Paginator<T> extends ChangeNotifier {
  final List<T> items = [];
  final LoadPage<T> _loader;

  int _nextPage = 1;
  bool _loading = false;
  bool _finished = false;

  Paginator(this._loader) {
    loadNextPage();
  }

  bool get loading => _loading;

  bool get finished => _finished;

  Future<void> loadNextPage() async {
    if (!_finished && !_loading) {
      _loading = true;
      notifyListeners();

      final page = await _loader(_nextPage);

      if (page != null) {
        items.addAll(page.results);
        _finished = page.page >= page.totalPages;
        _nextPage++;
      }
      _loading = false;
      notifyListeners();
    }
  }

  void reset() {
    items.clear();
    _nextPage = 1;
    _loading = false;
    _finished = false;
    loadNextPage();
  }
}
