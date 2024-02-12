import 'package:stash_book/const/database_const.dart';

class AccountDto {
  int inquiry; // 所持金

  AccountDto({required this.inquiry});

  // DBにDTOのデータをinsertする
  Map<String, dynamic> toMap() => {
        DatabaseConst.columnInquiry: inquiry,
      };
}
