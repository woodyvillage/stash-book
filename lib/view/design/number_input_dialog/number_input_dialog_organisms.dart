import 'package:flutter/material.dart';
import 'package:stash_book/view/design/widget/molecules/number_input_dialog_molecules.dart';

class NumberInputDialogOrganisms extends StatefulWidget {
  const NumberInputDialogOrganisms({
    super.key,
    required this.title,
    required this.type,
  });
  final String title;
  final int type;

  @override
  State createState() => _NumberInputDialogOrganismsState();
}

class _NumberInputDialogOrganismsState
    extends State<NumberInputDialogOrganisms> {
  final TextEditingController _appCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return NumberInputDialogMolecules(
      controller: _appCtrl,
      title: widget.title,
      type: widget.type,
    );
  }
}
