import 'package:flutter/material.dart';
import 'package:stash_book/model/form/dto/abstract/base_form_dto.dart';
import 'package:stash_book/view/design/widget/molecules/multi_input_dialog_molecules.dart';

class MultiInputDialogOrganisms<T extends BaseFormDto> extends StatefulWidget {
  const MultiInputDialogOrganisms({
    super.key,
    required this.title,
    required this.items,
  });
  final String title;
  final T items;

  @override
  State createState() => _MultiInputDialogOrganismsState();
}

class _MultiInputDialogOrganismsState extends State<MultiInputDialogOrganisms> {
  @override
  Widget build(BuildContext context) {
    return MultiInputDialogMolecules(
      title: widget.title,
      items: widget.items,
    );
  }
}
