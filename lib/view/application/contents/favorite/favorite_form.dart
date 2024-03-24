import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:stash_book/const/routing_const.dart';
import 'package:stash_book/model/form/dto/form_button_dto.dart';
import 'package:stash_book/view/application/contents/common/application_implement.dart';
import 'package:stash_book/view/design/command_button/command_button_organisms.dart';

class FavoriteForm extends StatefulWidget {
  const FavoriteForm({super.key, required this.edit, required this.index});
  final bool edit;
  final int index;

  @override
  State createState() => _FavoriteFormState();
}

class _FavoriteFormState extends State<FavoriteForm> {
  List<FormButtonDto> items = [];

  @override
  void initState() {
    super.initState();

    // CommandButtonオブジェクトの埋め込み
    items = implementCommandButton(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          title: Text(AppLocalizations.of(context)!
              .floater(floaterText[widget.index]))),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            CommandButtonOrganisms(items: items),
          ],
        ),
      ),
    );
  }
}
