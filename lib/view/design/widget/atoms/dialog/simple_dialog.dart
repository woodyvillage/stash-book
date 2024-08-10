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
        insetPadding: const EdgeInsets.all(15),
        title: title,
        content: const SizedBox(
          width: 400,
          height: 0,
        ),
        actions: actions,
      );
    } else {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(15),
        title: title,
        // content: content,
        content: SizedBox(
          width: 400,
          child: content,
        ),
        actions: actions,
      );
    }
  }
}
