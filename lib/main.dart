import 'package:flutter/material.dart';
import 'package:movies/api/movies_service.dart';
import 'package:movies/di/di.dart';
import 'package:movies/screens/home.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:movies/viewmodels/movies.dart';
import 'package:provider/provider.dart';

void main() async {
  configure();
  final movies = await getIt<MoviesService>().getPopular(1);
  for (final m in movies.results) {
    print('${m.title} ${m.posterPath}');
  }
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => getIt<ConfigViewModel>()),
        ChangeNotifierProvider(create: (context) => getIt<MoviesViewModel>()),
      ],
      child: MaterialApp(
        title: 'Movies',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
