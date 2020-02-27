import 'package:flutter_test/flutter_test.dart';
import 'package:movies/widgets/movie_item.dart';

import 'mock_data.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(
      MovieItem(movie: testMovie),
    );
  });
}
