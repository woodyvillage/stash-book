class DatabaseConst {
  // データベース定義
  static const databaseName = 'StashBook.db';
  static const databaseVersion = 6;

  // 設定テーブル
  static const tableSetting = "settings";
  static const columnSequence = 'sequence';
  static const columnKey = 'key';
  static const columnValue = 'value';

  //  所持金テーブル
  static const tablePossession = "possession";
  static const columnPossession = 'possession';

  // 入出金テーブル
  static const tableAccount = "account";
  static const columnId = 'id';
  static const columnDate = 'date';
  static const columnRemarks = 'remarks';
  static const columnPrice = 'price';
  static const columnFavorite = 'remarks';

  static final ddlScripts = {
    '0': ['SELECT $columnPossession FROM $tablePossession;'],
    '1': [
      'CREATE TABLE $tablePossession ($columnPossession INTEGER NOT NULL);'
    ],
    '2': [
      'CREATE TABLE $tableSetting ($columnSequence INTEGER NOT NULL, $columnKey TEXT NOT NULL, $columnValue TEXT NOT NULL);'
    ],
    '3': ['insert into $tableSetting values(1, "MINIMUM", "750");'],
    '4': ['insert into $tableSetting values(2, "MAXIMUM", "900");'],
    '5': ['insert into $tableSetting values(3, "INCREMENT", "10");'],
    '6': [
      'CREATE TABLE $tableAccount ($columnId INTEGER PRIMARY KEY, $columnDate TEXT NOT NULL, $columnRemarks TEXT, $columnPrice INTEGER NOT NULL);'
    ],
  };
}
