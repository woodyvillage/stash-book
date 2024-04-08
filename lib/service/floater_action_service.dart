import 'package:flutter/material.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/service/account_service.dart';
import 'package:stash_book/view/application/contents/favorite/favorite_form.dart';

class FloaterActionService {
  static dispatch(
    BuildContext context,
    ApplicationBloc bloc,
    int index,
  ) {
    MaterialPageRoute route;
    switch (index) {
      case indexReceipt:
        expense(bloc);
        break;
      case indexMenu:
        route = MaterialPageRoute(
          builder: (context) => FavoriteForm(
            edit: false,
            index: index,
          ),
        );
        Navigator.push(
          context,
          route,
        );
        break;
    }
  }
}
