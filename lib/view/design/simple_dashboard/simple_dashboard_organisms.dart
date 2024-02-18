import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/model/data/dao/account_dao.dart';
import 'package:stash_book/model/data/dto/account_dto.dart';
import 'package:stash_book/service/account_service.dart';
import 'package:stash_book/view/design/widget/molecules/simple_dashboard_molecules.dart';

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
    _getInquiry();
    _getCallback();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<ApplicationBloc>(context);
  }

  _getInquiry() async {
    // 起動時の最初の一回
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // ローカルDB内のアカウントテーブルをチェック
      AccountDao account = AccountDao();
      AccountDto dto = await account.select();
      _bloc.deposit.add(dto.inquiry);
    });
  }

  _getCallback() {
    _func = () async {
      await deposit(context, _bloc);
    };
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDashboardMolecules(bloc: _bloc, func: _func);
  }
}
