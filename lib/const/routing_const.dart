import 'package:flutter/material.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/const/configuration_const.dart';
import 'package:stash_book/view/application/contents/menu/menu_body.dart';
import 'package:stash_book/view/application/contents/receipt/receipt_body.dart';
import 'package:stash_book/view/configuration/contents/general/general_body.dart';

// =============================================================================
// ページコントローラー
// =============================================================================
final PageController contentsController = PageController(
  initialPage: 0,
  viewportFraction: 1.0,
);
final PageController settingsController = PageController(
  initialPage: 0,
  viewportFraction: 1.0,
);

// =============================================================================
// アプリコンテンツレイヤに配置する可変ページャー
// =============================================================================
final List<Widget> contentsClasses = [
  const ReceiptBody(),
  const MenuBody(),
];

final List<Icon> contentsIcons = [
  const Icon(Icons.format_list_numbered),
  const Icon(Icons.format_list_numbered),
];

final List<String> contentsTexts = [
  contentsReceipt,
  contentsMenu,
];

// =============================================================================
// コンフィグコンテンツレイヤに配置する可変ページャー
// =============================================================================
final settingsClasses = [
  const GeneralBody(),
];

final settingsIcons = [
  const Icon(Icons.home),
];

final List<String> settingsText = [
  settingsGeneral,
];

// =============================================================================
// アプリコンテンツレイヤに配置するフローティングボタン
// =============================================================================
final floaterClasses = [
  const ReceiptBody(),
  const MenuBody(),
];

final floaterIcon = [
  const Icon(Icons.add),
  const Icon(Icons.playlist_add),
  null,
];

final List<String> floaterText = [
  floaterReceipt,
  floaterMenu,
];
