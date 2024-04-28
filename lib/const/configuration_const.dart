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
  [patternButton, 'C01', 'INITIALIZE', typeNothing, ""],
  [patternButton, 'C02', 'ACCOUNT_MAXIMUM', typeNothing, ""],
  [patternButton, 'C03', 'ACCOUNT_MINIMUM', typeNothing, ""],
  [patternButton, 'C04', 'ACCOUNT_REMARKS', typeNothing, ""],
];
