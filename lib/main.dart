import 'package:flutter/material.dart';
import 'package:movies/api/movies_service.dart';
import 'package:movies/di/di.dart';
import 'package:movies/screens/home.dart';

void main() async {
  configure();

  final movies = await getIt<MovieService>().getPopular();
  for (final m in movies.results) {
    print('${m.title} ${m.posterPath}');
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
