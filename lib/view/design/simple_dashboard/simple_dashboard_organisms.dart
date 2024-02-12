import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stash_book/bloc/application_bloc.dart';
import 'package:stash_book/view/design/widget/molecules/simple_dashboard_molecules.dart';

class SimpleDashboardOrganisms extends StatefulWidget {
  const SimpleDashboardOrganisms({super.key});

  @override
  State createState() => _SimpleDashboardOrganismsState();
}

class _SimpleDashboardOrganismsState extends State<SimpleDashboardOrganisms> {
  late ApplicationBloc _bloc;

  @override
  void initState() {
    super.initState();
    _getPreference();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _bloc = Provider.of<ApplicationBloc>(context);
  }

  _getPreference() async {
    // 起動時の最初の一回
  }

  @override
  Widget build(BuildContext context) {
    return const SimpleDashboardMolecules();
  }
}
