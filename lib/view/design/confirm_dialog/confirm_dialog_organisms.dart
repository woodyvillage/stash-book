import 'package:flutter/material.dart';
import 'package:stash_book/view/design/widget/molecules/confirm_dialog_molecules.dart';

class ConfirmDialogOrganisms extends StatefulWidget {
  const ConfirmDialogOrganisms({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State createState() => _ConfirmDialogOrganismsState();
}

class _ConfirmDialogOrganismsState extends State<ConfirmDialogOrganisms> {
  @override
  Widget build(BuildContext context) {
    return ConfirmDialogMolecules(title: widget.title);
  }
}
