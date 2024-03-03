import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/model/form/dto/form_button_dto.dart';
import 'package:stash_book/view/design/widget/molecules/command_button_molecules.dart';

class CommandButtonOrganisms extends StatefulWidget {
  const CommandButtonOrganisms({super.key, required this.items});
  final List<FormButtonDto> items;

  @override
  State createState() => _CommandButtonOrganismsState();
}

class _CommandButtonOrganismsState extends State<CommandButtonOrganisms> {
  @override
  void initState() {
    super.initState();
  }

  void buildDto() {
    for (var item in widget.items) {
      switch (item.index) {
        case functionSubmit:
          item.caption = Text(AppLocalizations.of(context)!.submit);
          item.foreColor = Colors.white;
          item.backColor = Colors.green;
          item.icon = Icons.check_circle_outlined;
          break;
        case functionCancel:
          item.caption = Text(AppLocalizations.of(context)!.cancel);
          item.foreColor = Colors.white;
          item.backColor = Colors.orange;
          item.icon = Icons.cancel_outlined;
          break;
        // case functionDelete:
        //   item.caption = Text(
        //       AppLocalizations.of(context)!.command_button(functionDelete));
        //   item.foreColor = Colors.white;
        // item.backColor = Colors.red;
        //   item.icon = Icons.arrow_circle_left_outlined;
        //   break;
        default:
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    buildDto();
    return CommandButtonMolecules(
      items: widget.items,
    );
  }
}
