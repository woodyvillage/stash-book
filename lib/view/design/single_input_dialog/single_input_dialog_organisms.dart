import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/form_editor_dto.dart';
import 'package:stash_book/view/design/widget/molecules/single_input_dialog_molecules.dart';

class SingleInputDialogOrganisms extends StatefulWidget {
  const SingleInputDialogOrganisms({
    super.key,
    required this.item,
  });
  final FormEditorDto item;

  @override
  State createState() => _SingleInputDialogOrganismsState();
}

class _SingleInputDialogOrganismsState
    extends State<SingleInputDialogOrganisms> {
  @override
  Widget build(BuildContext context) {
    return SingleInputDialogMolecules(
      item: widget.item,
    );
  }
}
