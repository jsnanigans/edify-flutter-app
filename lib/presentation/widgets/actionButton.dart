import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  ActionButton({Key? key, this.action}) : super(key: key);
  final VoidCallback? action;


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        tooltip: 'Play track', child: const Icon(Icons.play_arrow_rounded), onPressed: action,);
  }
}
