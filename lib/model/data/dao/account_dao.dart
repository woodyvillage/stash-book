import 'package:stash_book/model/data/dao/abstract/base_dao.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';

class AccountDao extends BaseDao {
  Future<bool> isAuthorized() async {
    AccountDto dto = AccountDto(inquiry: 0);
    int? result = await count(dto);
    print('isAuthorized => ${result == 0 ? false : true}');

    return result == null
        ? false
        : result == 0
            ? false
            : true;
  }

  Future<int> initialize() async {
    AccountDto dto = AccountDto(inquiry: 12345);
    return await insert(dto);
  }
}
