import 'package:flutter/material.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/service/account_service.dart';
import 'package:stash_book/service/favorite_service.dart';

class FloaterActionService {
  static dispatch(
    BuildContext context,
    ApplicationBloc bloc,
    int index,
  ) {
    switch (index) {
      case indexReceipt:
        payment(bloc);
        break;
      case indexMenu:
        entry(context, bloc);
        break;
    }
  }
}
