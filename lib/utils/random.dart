import 'dart:math';

final _random = Random();

const _chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

String randomTag([int length = 8]) {
  return List.generate(
    length,
    (_) => _chars[_random.nextInt(_chars.length)],
  ).join();
}
