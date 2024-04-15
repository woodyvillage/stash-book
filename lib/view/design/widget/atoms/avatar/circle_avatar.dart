import 'package:flutter/material.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';
import 'package:stash_book/view/utility/format_utility.dart';

class CircleAvatarAtoms extends AtomWidget {
  const CircleAvatarAtoms({
    super.key,
    required this.mode,
    required this.price,
  });
  final int mode;
  final int price;

  @override
  Widget buildMaterial(BuildContext context) {
    Color bg = mode == 0 ? Colors.blue : Colors.white;
    Color fg = mode == 0 ? Colors.white : Colors.blue;
    return CircleAvatar(
      backgroundColor: Colors.blue,
      radius: 30,
      child: CircleAvatar(
        foregroundColor: fg,
        backgroundColor: bg,
        radius: 25,
        child: Text(formatCurrency(context, price)),
      ),
    );
  }
}
