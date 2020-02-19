import 'package:flutter/material.dart';
import 'package:movies/utils/colors.dart';

class SearchHeader extends StatelessWidget {
  final TextEditingController controller;

  const SearchHeader({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: MoviesColors.cyan,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: 64,
            right: 64,
          ),
          child: Column(
            children: [
              Text(
                'Hello, what do you want to watch?',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 24),
              _SearchField(controller: controller),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController controller;

  const _SearchField({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 38,
          decoration: ShapeDecoration(
            shape: StadiumBorder(),
            color: MoviesColors.lightBlue,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4, right: 24),
          child: TextField(
            controller: controller,
            maxLines: 1,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              isDense: true,
              hintText: 'Search',
              hintStyle: TextStyle(
                fontSize: 16,
              ),
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
                size: 24,
              ),
            ),
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
