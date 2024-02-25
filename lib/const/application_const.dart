import 'package:stash_book/const/common_const.dart';

// =============================================================================
// 定数
// =============================================================================
// アプリケーションのページインデックス
const int indexReceipt = 0;
const int indexMenu = 1;

// アプリケーションのページネーム
const String contentsReceipt = 'RECEIPT';
const String contentsMenu = 'MENU';

// アプリケーションのフロートネーム
const String floaterReceipt = 'RECEIPTADD';
const String floaterMenu = 'MENUADD';

// =============================================================================
// アプリケーションアクションリスト
// =============================================================================
// 固定インデックス
const int indexDeposit = 0;
const int indexExpense = 1;

final applicationLists = [
  [patternButton, 'A01', 'DEPOSIT', typeNumeric],
  [patternButton, 'A02', 'EXPENSE', typeNumeric],
];
