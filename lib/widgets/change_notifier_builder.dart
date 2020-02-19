import 'package:flutter/widgets.dart';

class ChangeNotifierBuilder<T extends ChangeNotifier> extends StatefulWidget {
  final T notifier;
  final WidgetBuilder builder;

  const ChangeNotifierBuilder({
    Key key,
    this.notifier,
    this.builder,
  })  : assert(notifier != null),
        assert(builder != null),
        super(key: key);

  @override
  _ChangeNotifierBuilderState createState() => _ChangeNotifierBuilderState();
}

class _ChangeNotifierBuilderState extends State<ChangeNotifierBuilder> {
  @override
  void initState() {
    super.initState();
    widget.notifier.addListener(_onNotified);
  }

  @override
  void dispose() {
    widget.notifier.removeListener(_onNotified);
    super.dispose();
  }

  void _onNotified() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return widget.builder(context);
    });
  }
}
