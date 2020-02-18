import 'package:flutter/material.dart';
import 'package:movies/viewmodels/config.dart';
import 'package:movies/utils/status.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final config = Provider.of<ConfigViewModel>(context);

    if (config.status == Status.loading) {
      return Container();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Teste'),
      ),
      body: Image.network(
        config.posterUrl('/7GsM4mtM0worCtIVeiQt28HieeN.jpg', 150),
      ),
    );
  }
}
