import 'package:flutter/material.dart';
import 'package:stash_book/view/design/widget/molecules/number_input_dialog_molecules.dart';

class NumberInputDialogOrganisms extends StatefulWidget {
  const NumberInputDialogOrganisms({
    super.key,
    required this.title,
    required this.value,
    required this.type,
  });
  final String title;
  final String value;
  final int type;

  @override
  State createState() => _NumberInputDialogOrganismsState();
}

class _NumberInputDialogOrganismsState
    extends State<NumberInputDialogOrganisms> {
  late TextEditingController _appCtrl;

  @override
  Widget build(BuildContext context) {
    _appCtrl = widget.value == ""
        ? TextEditingController()
        : TextEditingController(text: widget.value);
    return NumberInputDialogMolecules(
      controller: _appCtrl,
      title: widget.title,
      type: widget.type,
    );
  }
}
