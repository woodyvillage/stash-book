import 'package:stash_book/const/database_const.dart';

class AccountDto {
  int no;
  String date;
  String remarks;
  int price;
  int menu; // 0:ランダム出費 n:お気に入りNo
  int mode; // 0:入金 1:出金
  int deleted; // 1:削除

  AccountDto({
    required this.no,
    required this.date,
    required this.remarks,
    required this.price,
    required this.menu,
    required this.mode,
    required this.deleted,
  });

  // DBから読み取った値をDTOに詰める
  factory AccountDto.parse(Map<String, dynamic> record) => AccountDto(
        no: record[DatabaseConst.columnNo],
        date: record[DatabaseConst.columnDate],
        remarks: record[DatabaseConst.columnRemarks],
        price: record[DatabaseConst.columnPrice],
        menu: record[DatabaseConst.columnMenu],
        mode: record[DatabaseConst.columnMode],
        deleted: record[DatabaseConst.columnDeleted],
      );

  // DBにDTOのデータをinsertする
  Map<String, dynamic> toMap() => {
        DatabaseConst.columnDate: date,
        DatabaseConst.columnRemarks: remarks,
        DatabaseConst.columnPrice: price,
        DatabaseConst.columnMenu: menu,
        DatabaseConst.columnMode: mode,
        DatabaseConst.columnDeleted: deleted,
      };

  String getDate() {
    return date;
  }

  String getRemarks() {
    return remarks;
  }

  int getPrice() {
    return price;
  }
}
