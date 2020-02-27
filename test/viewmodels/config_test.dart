import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies/models/models.dart';
import 'package:movies/utils/status.dart';
import 'package:movies/viewmodels/config.dart';

import '../mocks.dart';

const config = Config(
  images: ImageConfig(),
);

void main() {
  test('ConfigViewModel loads correctly', () {
    final configServiceMock = ConfigServiceMock();

    when(configServiceMock.getConfig()).thenAnswer((_) async => config);

    final configViewModel = ConfigViewModel(configServiceMock);

    expect(configViewModel.status, Status.success);
  });
}
