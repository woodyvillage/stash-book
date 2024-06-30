class DatabaseConst {
  // データベース定義
  static const databaseName = 'StashBook.db';
  static const databaseVersion = 7;

  // テーブル共通
  static const columnNo = 'no';
  static const sortDesc = 'desc';

  // 設定テーブル
  static const tableSetting = "settings";
  static const columnKey = 'key';
  static const columnValue = 'value';

  // 所持金テーブル
  static const tablePossession = "possession";
  static const columnPossession = 'possession';

  // 入出金テーブル
  // お気に入りテーブル
  static const tableAccount = "account";
  static const tableFavorite = "favorite";
  static const columnDate = 'date';
  static const columnRemarks = 'remarks';
  static const columnPrice = 'price';
  static const columnMode = 'mode';
  static const columnCategory = 'category';

  static final ddlScripts = {
    '0': ['SELECT $columnPossession FROM $tablePossession;'],
    '1': [
      'CREATE TABLE $tablePossession ($columnPossession INTEGER NOT NULL);'
    ],
    '2': [
      'CREATE TABLE $tableSetting ($columnNo INTEGER PRIMARY KEY AUTOINCREMENT, $columnKey TEXT NOT NULL, $columnValue TEXT NOT NULL);'
    ],
    '3': ['insert into $tableSetting values(1, "account_minimum", "750");'],
    '4': ['insert into $tableSetting values(2, "account_maximum", "900");'],
    '5': ['insert into $tableSetting values(3, "account_remarks", "ランチ代");'],
    '6': [
      'CREATE TABLE $tableAccount ($columnNo INTEGER PRIMARY KEY AUTOINCREMENT, $columnDate TEXT NOT NULL, $columnRemarks TEXT, $columnPrice INTEGER NOT NULL, $columnMode INTEGER NOT NULL);'
    ],
    '7': [
      'CREATE TABLE $tableFavorite ($columnNo INTEGER PRIMARY KEY AUTOINCREMENT, $columnCategory TEXT, $columnRemarks TEXT, $columnPrice INTEGER NOT NULL);'
    ],
  };
}
