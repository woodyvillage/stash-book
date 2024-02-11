import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/const/routing_const.dart';
import 'package:stash_book/service/navigator_position_service.dart';

class ApplicationContents extends StatefulWidget {
  const ApplicationContents({super.key});

  @override
  State createState() => _ApplicationContentsState();
}

class _ApplicationContentsState extends State<ApplicationContents> {
  @override
  void initState() {
    super.initState();

    // ページが変更されたときに呼ばれるコールバック
    contentsController.addListener(() {
      setState(() {
        // BottomNavigationBarItemの更新を促す
        context
            .read<NavigatorPositionService>()
            .changed(contentsController.page?.round() ?? 0);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // // 固定ヘッダ
        // Container(
        //   margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        //   width: MediaQuery.of(context).size.width,
        //   height: 70,
        //   child: Text(l10n.applicationTitle),
        // ),
        // 可変ページャー
        Expanded(
          child: PageView(
            controller: contentsController,
            children: contentsClasses,
          ),
        ),
      ],
    );
  }
}
