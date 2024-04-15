import 'package:stash_book/const/database_const.dart';
import 'package:stash_book/model/data/dao/abstract/base_dao.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';

class AccountDao extends BaseDao<AccountDto> {
  @override
  String scope() => DatabaseConst.tableAccount;

  @override
  List<AccountDto> parseResult(List<Map<String, dynamic>> result) {
    return result.isNotEmpty
        ? result.map((item) => AccountDto.parse(item)).toList()
        : [];
  }
}
