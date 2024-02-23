import 'package:flutter/material.dart';
import 'package:stash_book/view/configuration/contents/configuration_contents.dart';
import 'package:stash_book/view/header/application_header.dart';

class ConfigurationFrame extends StatelessWidget {
  const ConfigurationFrame({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // ヘッダー
      appBar: ApplicationHeader(isView: false),
      // // コンテンツ
      body: ConfigurationContents(),
    );
  }
}
