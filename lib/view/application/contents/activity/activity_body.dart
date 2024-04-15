import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/view/design/account_list_tile/account_list_tile_organisms.dart';

class ActivityBody extends StatefulWidget {
  const ActivityBody({super.key});

  @override
  State createState() => _ActivityBodyState();
}

class _ActivityBodyState extends State<ActivityBody> {
  late ApplicationBloc bloc;

  @override
  void didChangeDependencies() {
    // 起動時の最初の一回
    super.didChangeDependencies();
    bloc = Provider.of<ApplicationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc.account,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return AccountListTileOrganisms(item: snapshot.data![index]);
                });
          } else {
            return ListView();
          }
        });
  }
}
