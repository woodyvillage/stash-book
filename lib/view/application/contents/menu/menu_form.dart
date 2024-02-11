import 'package:flutter/material.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/const/routing_const.dart';

class MenuForm extends StatefulWidget {
  const MenuForm({super.key, required this.edit});
  final bool edit;

  @override
  State createState() => _MenuFormState();
}

class _MenuFormState extends State<MenuForm> {
  // List<FormButtonDto> items = [];

  @override
  void initState() {
    super.initState();

    // CommandButtonオブジェクトの埋め込み
    // items = implementCommandButton(context);
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
        // child: ListView(
        //   children: <Widget>[
        //     const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
        //     CommandButtonOrganisms(items: items),
        //   ],
        // ),
      ),
    );
  }
}
