import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';
import 'package:turbostat_tdd/injection_container.dart';

class EditCarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      bottomNavigationBar: BottomNavigation(),
      body: buildBody(context),
    );
  }

  BlocProvider<LoadDataBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoadDataBloc>(),
      child: EditCarForm(),
    );
  }
}