import 'package:stash_book/const/database_const.dart';

class AccountDto {
  int inquiry; // 所持金

  AccountDto({required this.inquiry});

  // DBから読み取った値をDTOに詰める
  factory AccountDto.parse(Map<String, dynamic> record) => AccountDto(
        inquiry: record[DatabaseConst.columnInquiry],
      );

  // DBにDTOのデータをinsertする
  Map<String, dynamic> toMap() => {
        DatabaseConst.columnInquiry: inquiry,
      };
}
