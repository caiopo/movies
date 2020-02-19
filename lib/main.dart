import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies/di/di.dart';
import 'package:movies/models/models.dart';
import 'package:movies/screens/home/home.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:movies/viewmodels/movies.dart';
import 'package:provider/provider.dart';

void main() async {
  configure();
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
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: MaterialApp(
          title: 'Movies',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textSelectionColor: MoviesColors.cyan,
            brightness: Brightness.dark,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
