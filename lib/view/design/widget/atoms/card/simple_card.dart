import 'package:flutter/material.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';

class SimpleCardAtoms extends AtomWidget {
  const SimpleCardAtoms({
    super.key,
    required this.child,
  });
  final List<Widget> child;

  @override
  Widget buildMaterial(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.all(5),
      shape: const RoundedRectangleBorder(),
      child: Column(children: child),
    );
  }
}
