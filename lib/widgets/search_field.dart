import 'package:flutter/material.dart';
import 'package:movies/utils/colors.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: ShapeDecoration(
        shape: StadiumBorder(),
        color: MoviesColors.lightBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
        child: TextField(
          onChanged: (t) {},
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              fontSize: 16,
            ),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
