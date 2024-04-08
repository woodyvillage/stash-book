import 'package:rxdart/rxdart.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/model/data/dto/possession_dto.dart';
import 'package:stash_book/service/account_service.dart';
import 'package:stash_book/service/possession_service.dart';

class ApplicationBloc {
  // 入金
  final _getDepositController = BehaviorSubject<int>();
  Sink<int> get deposit => _getDepositController.sink;

  // 出金
  final _getExpenseController = BehaviorSubject<int>();
  Sink<int> get expense => _getExpenseController.sink;

  // 所持金
  final _setPossessionController = BehaviorSubject<int>();
  Stream<int> get possession => _setPossessionController.stream;

  // 明細
  final _setAccountController = BehaviorSubject<List<AccountDto>>();
  Stream<List<AccountDto>> get account => _setAccountController.stream;

  ApplicationBloc() {
    // 入金した金額を加算して所持金に流す
    _getDepositController.stream.listen((deposit) async {
      // 所持金の取得と更新
      PossessionDto dto = await getPossession();
      dto.possession += deposit;
      await setPossession(dto);
      print(
          'ApplicationBloc listen[deposit]$deposit sink[possession]${dto.possession}');
      _setPossessionController.sink.add(dto.possession);

      // 最新の収支リストを更新
      List<AccountDto> dtos = await getActivity();
      _setAccountController.sink.add(dtos);
    });

    // 出金した金額を減算して所持金に流す
    _getExpenseController.stream.listen((expense) async {
      // 所持金の取得と更新
      PossessionDto dto = await getPossession();
      dto.possession -= expense;
      await setPossession(dto);
      print(
          'ApplicationBloc listen[expense]$expense sink[possession]${dto.possession}');
      _setPossessionController.sink.add(dto.possession);

      // 最新の収支リストを更新
      List<AccountDto> dtos = await getActivity();
      _setAccountController.sink.add(dtos);
    });
  }

  void dispose() {
    _getDepositController.close();
    _getExpenseController.close();
    _setPossessionController.close();
    _setAccountController.close();
  }
}
