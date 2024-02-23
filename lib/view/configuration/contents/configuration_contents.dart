import 'package:flutter/material.dart';
import 'package:stash_book/const/routing_const.dart';

class ConfigurationContents extends StatefulWidget {
  const ConfigurationContents({super.key});

  @override
  State createState() => _ConfigurationContentsState();
}

class _ConfigurationContentsState extends State<ConfigurationContents> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 可変ページャー
        Expanded(
          child: PageView(
            controller: settingsController,
            children: settingsClasses,
          ),
        ),
      ],
    );
  }
}
