import 'package:rxdart/rxdart.dart';

class ApplicationBloc {
  // 入出金
  final _getAccountController = BehaviorSubject<int>();
  Sink<int> get account => _getAccountController.sink;

  // 所持金
  final _setPossessionController = BehaviorSubject<int>();
  Stream<int> get possession => _setPossessionController.stream;

  ApplicationBloc() {
    // 入出金から取り出した金額を所持金に流す
    _getAccountController.stream.listen((account) async {
      print('ApplicationBloc listen[account]$account sink[possession]$account');
      _setPossessionController.sink.add(account);
    });
  }

  void dispose() {
    _getAccountController.close();
    _setPossessionController.close();
  }
}
