import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/const/common_const.dart';
import 'package:stash_book/model/data/dao/account_dao.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';

class MenuActionService {
  static dispatch(
    ApplicationBloc bloc,
    AccountDto item,
    String? value,
  ) {
    switch (value) {
      case 'delete':
        AccountDao dao = AccountDao();
        item.deleted = intDeleted;
        dao.update(dao, item);

        if (item.mode == indexDeposit) {
          // 出金の通知
          bloc.withdraw.add(item.price);
        } else {
          // 入金の通知
          bloc.deposit.add(item.price);
        }

        break;
      default:
        // 何もしない
        break;
    }
  }
}
