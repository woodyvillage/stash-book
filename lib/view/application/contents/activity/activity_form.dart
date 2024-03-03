import 'package:flutter/material.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/const/routing_const.dart';
import 'package:stash_book/model/form/dto/form_button_dto.dart';
import 'package:stash_book/view/application/contents/common/application_implement.dart';
import 'package:stash_book/view/design/command_button/command_button_organisms.dart';

class ActivityForm extends StatefulWidget {
  const ActivityForm({super.key, required this.edit});
  final bool edit;

  @override
  State createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
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
        title: Text(floaterText[indexMenu]),
      ),
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
