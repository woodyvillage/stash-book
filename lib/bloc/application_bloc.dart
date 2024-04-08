import 'package:rxdart/rxdart.dart';

class ApplicationBloc {
  // 入金額
  final _getDepositController = BehaviorSubject<int>();
  Sink<int> get deposit => _getDepositController.sink;

  // 所持金
  final _setPossessionController = BehaviorSubject<int>();
  Stream<int> get possession => _setPossessionController.stream;

  ApplicationBloc() {
    // 入金
    _getDepositController.stream.listen((deposit) async {
      print('ApplicationBloc listen[deposit]$deposit sink[possession]$deposit');
      _setPossessionController.sink.add(deposit);
    });
  }

  void dispose() {
    _getDepositController.close();
    _setPossessionController.close();
  }
}
