import 'package:flutter/material.dart';
import 'package:stash_book/view/design/wrapper/atoms_widget.dart';
import 'package:stash_book/view/utility/contents_utility.dart';
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
    return CircleAvatar(
      backgroundColor: getPageBackgroundColor(mode),
      radius: 30,
      child: CircleAvatar(
        foregroundColor: getForegroundColor(mode),
        backgroundColor: getBackgroundColor(mode),
        radius: 25,
        child: Text(formatCurrency(context, price)),
      ),
    );
  }
}
