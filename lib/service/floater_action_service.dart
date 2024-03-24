import 'package:flutter/material.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/view/application/contents/activity/activity_form.dart';
import 'package:stash_book/view/application/contents/favorite/favorite_form.dart';

class FloaterActionService {
  static dispatch(
    BuildContext context,
    int index,
  ) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => ActivityForm(
        edit: false,
        index: index,
      ),
    );
    switch (index) {
      case indexMenu:
        route = MaterialPageRoute(
          builder: (context) => FavoriteForm(
            edit: false,
            index: index,
          ),
        );
        break;
    }
    Navigator.push(
      context,
      route,
    );
  }
}
