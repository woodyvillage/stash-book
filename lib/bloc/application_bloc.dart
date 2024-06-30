import 'package:flutter/foundation.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stash_book/model/data/dto/favorite_dto.dart';
import 'package:stash_book/model/data/dto/possession_dto.dart';
import 'package:stash_book/service/account_service.dart';
import 'package:stash_book/service/favorite_service.dart';
import 'package:stash_book/service/possession_service.dart';

class ApplicationBloc {
  // 入金
  final _getDepositController = BehaviorSubject<int>();
  Sink<int> get deposit => _getDepositController.sink;

  // 出金
  final _getWithdrawController = BehaviorSubject<int>();
  Sink<int> get withdraw => _getWithdrawController.sink;

  // 所持金
  final _setPossessionController = BehaviorSubject<PossessionDto>();
  Stream<PossessionDto> get possession => _setPossessionController.stream;

  // 明細
  final _setAccountController = BehaviorSubject<List<AccountDto>>();
  Stream<List<AccountDto>> get account => _setAccountController.stream;

  // お気に入り
  final _setFavoriteController = BehaviorSubject<List<FavoriteDto>>();
  Stream<List<FavoriteDto>> get favorite => _setFavoriteController.stream;

  ApplicationBloc() {
    // 入金した金額を加算して所持金に流す
    _getDepositController.stream.listen((deposit) async {
      // 所持金の取得と更新
      PossessionDto possession = await getPossession();
      possession.possession += deposit;
      await setPossession(possession);
      if (kDebugMode) {
        print(
            'ApplicationBloc listen[deposit]$deposit sink[possession]${possession.possession}');
      }
      _setPossessionController.sink.add(possession);

      // 最新の収支リストを更新
      List<AccountDto> accounts = await getActivity();
      _setAccountController.sink.add(accounts);

      // 最新のお気に入りリストを更新
      List<FavoriteDto> favorites = await getFavorite();
      _setFavoriteController.sink.add(favorites);
    });

    // 出金した金額を減算して所持金に流す
    _getWithdrawController.stream.listen((withdraw) async {
      // 所持金の取得と更新
      PossessionDto possession = await getPossession();
      possession.possession -= withdraw;
      await setPossession(possession);
      if (kDebugMode) {
        print(
            'ApplicationBloc listen[withdraw]$withdraw sink[possession]${possession.possession}');
      }
      _setPossessionController.sink.add(possession);

      // 最新の収支リストを更新
      List<AccountDto> accounts = await getActivity();
      _setAccountController.sink.add(accounts);

      // 最新のお気に入りリストを更新
      List<FavoriteDto> favorites = await getFavorite();
      _setFavoriteController.sink.add(favorites);
    });
  }

  void dispose() {
    _getDepositController.close();
    _getWithdrawController.close();
    _setPossessionController.close();
    _setAccountController.close();
    _setFavoriteController.close();
  }
}
