import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/model/form/dto/account_list_item_array_dto.dart';

class AccountListItemArrayDao {
  AccountListItemArrayDto createDto(
    List<List<Object>> list,
    AccountDto dto,
  ) {
    return AccountListItemArrayDto(
      items: list,
      value: dto,
    );
  }
}
