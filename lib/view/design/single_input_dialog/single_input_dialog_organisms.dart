import 'package:flutter/material.dart';
import 'package:stash_book/view/design/widget/molecules/single_input_dialog_molecules.dart';

class SingleInputDialogOrganisms extends StatefulWidget {
  const SingleInputDialogOrganisms({
    super.key,
    required this.title,
    required this.value,
    required this.type,
  });
  final String title;
  final String value;
  final int type;

  @override
  State createState() => _SingleInputDialogOrganismsState();
}

class _SingleInputDialogOrganismsState
    extends State<SingleInputDialogOrganisms> {
  @override
  Widget build(BuildContext context) {
    return SingleInputDialogMolecules(
      title: widget.title,
      value: widget.value,
      type: widget.type,
    );
  }
}
