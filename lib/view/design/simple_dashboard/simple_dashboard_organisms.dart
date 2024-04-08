import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/const/application_const.dart';
import 'package:stash_book/model/data/dto/possession_dto.dart';
import 'package:stash_book/service/possession_service.dart';
import 'package:stash_book/view/design/widget/molecules/simple_dashboard_molecules.dart';
import 'package:stash_book/view/utility/callback_utility.dart';

class SimpleDashboardOrganisms extends StatefulWidget {
  const SimpleDashboardOrganisms({super.key});

  @override
  State createState() => _SimpleDashboardOrganismsState();
}

class _SimpleDashboardOrganismsState extends State<SimpleDashboardOrganisms> {
  late ApplicationBloc _bloc;
  late VoidCallback _func;

  @override
  void initState() {
    super.initState();
    _getPossession();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<ApplicationBloc>(context);
    _func = makeCallback(
      context,
      applicationLists[indexDeposit],
    );
  }

  _getPossession() async {
    // 起動時の最初の一回
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // 所持金を取得して再描画
      PossessionDto dto = await getPossession();
      _bloc.deposit.add(dto.possession);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDashboardMolecules(
      bloc: _bloc,
      func: _func,
    );
  }
}
