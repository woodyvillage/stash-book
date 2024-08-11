import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/model/form/dto/abstract/base_form_dto.dart';

class AccountListItemArrayDto extends BaseFormDto {
  AccountDto value;

  AccountListItemArrayDto({
    super.items,
    required this.value,
  });

  @override
  AccountDto get dto => value;
}
