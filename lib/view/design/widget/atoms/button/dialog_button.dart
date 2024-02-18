import 'package:flutter/material.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class DialogButtonAtoms extends AtomWidget {
  const DialogButtonAtoms({
    super.key,
    required this.title,
    required this.callback,
  });
  final String title;
  final VoidCallback callback;

  @override
  Widget buildMaterial(BuildContext context) {
    return TextButton(
      onPressed: callback,
      child: Text(title),
    );
  }
}
