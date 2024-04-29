import 'package:stash_book/const/common_const.dart';

// =============================================================================
// 定数
// =============================================================================
const int indexGeneral = 0;

const String settingsGeneral = 'GENERAL';

const String settingsMinimum = 'MINIMUM';
const String settingsMaximum = 'MAXIMUM';
const String settingsRemarks = 'REMARKS';

// =============================================================================
// コンフィグアクションリスト
// =============================================================================
final settingsLists = [
  // 種別,キー,識別子,初期値,固定値
  [patternButton, 'C01', 'db_initialize', typeNothing, stringNull],
  [patternButton, 'C02', 'account_maximum', typeNumeric, stringNull],
  [patternButton, 'C03', 'account_minimum', typeNumeric, stringNull],
  [patternButton, 'C04', 'account_remarks', typeString, stringNull],
];
