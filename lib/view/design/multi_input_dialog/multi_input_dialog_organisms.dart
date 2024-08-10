import 'package:flutter/material.dart';
import 'package:stash_book/view/design/widget/molecules/multi_input_dialog_molecules.dart';

class MultiInputDialogOrganisms extends StatefulWidget {
  const MultiInputDialogOrganisms({
    super.key,
    required this.title,
    required this.items,
    required this.value,
  });
  final String title;
  final List<List<Object>> items;
  final Object value;

  @override
  State createState() => _MultiInputDialogOrganismsState();
}

class _MultiInputDialogOrganismsState extends State<MultiInputDialogOrganisms> {
  @override
  Widget build(BuildContext context) {
    return MultiInputDialogMolecules(
      title: widget.title,
      items: widget.items,
      value: widget.value,
    );
  }
}
