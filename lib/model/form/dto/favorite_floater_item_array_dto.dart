import 'package:stash_book/model/data/dto/favorite_dto.dart';
import 'package:stash_book/model/form/dto/abstract/base_form_dto.dart';

class FavoriteFloaterItemArrayDto extends BaseFormDto {
  FavoriteDto value;

  FavoriteFloaterItemArrayDto({
    super.items,
    required this.value,
  });

  @override
  FavoriteDto get dto => value;
}
