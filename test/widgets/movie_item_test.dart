import 'package:flutter_test/flutter_test.dart';
import 'package:movies/widgets/movie_item.dart';

import '../mock_data.dart';
import 'utils.dart';

void main() {
  testWidgets('MovieItem has a title, image and rating', (tester) async {
    await tester.pumpWidget(
      TestWrap(
        child: MovieItem(movie: testMovie),
      ),
    );

    await expectLater(
      find.byType(MovieItem),
      matchesGoldenFile('goldens/myWidget.png'),
    );
  });
}
