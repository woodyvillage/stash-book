import 'package:flutter/material.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/view/application/contents/menu/menu_form.dart';
import 'package:stash_book/view/application/contents/receipt/receipt_form.dart';

class FloaterActionService {
  static dispatch(
    BuildContext context,
    int index,
  ) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => const ReceiptForm(edit: false),
    );

    switch (index) {
      case indexMenu:
        route = MaterialPageRoute(
          builder: (context) => const MenuForm(edit: false),
        );
        break;
    }
    Navigator.push(
      context,
      route,
    );
  }
}
