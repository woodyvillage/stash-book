import 'package:stash_book/model/form/dto/favorite_dto_impl.dart';

abstract class BaseFormDto implements FavoriteDtoImpl {
  List<List<Object>>? items;

  BaseFormDto({
    this.items,
  });
}
