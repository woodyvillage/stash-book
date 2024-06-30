import 'package:flutter/material.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class SimpleDialogAtoms extends AtomWidget {
  const SimpleDialogAtoms({
    super.key,
    required this.title,
    this.content,
    required this.actions,
  });
  final Text title;
  final Widget? content;
  final List<Widget> actions;

  @override
  Widget buildMaterial(BuildContext context) {
    if (content == null) {
      return AlertDialog(
        title: title,
        actions: actions,
      );
    } else {
      return AlertDialog(
        title: title,
        content: content,
        actions: actions,
      );
    }
  }
}
