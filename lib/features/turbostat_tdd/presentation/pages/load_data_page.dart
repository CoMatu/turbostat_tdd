import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/bloc/bloc.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/widgets.dart';
import 'package:turbostat_tdd/injection_container.dart';

class LoadDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: SingleChildScrollView(child: buildBody(context)),
    );
  }

  BlocProvider<LoadDataBloc> buildBody(BuildContext context) {
    return BlocProvider(
      builder: (_) => sl<LoadDataBloc>(),
      child:
          BlocBuilder<LoadDataBloc, LoadDataState>(builder: (context, state) {
        return Column(
          children: <Widget>[
            Container(
              height: 50,
              child: Placeholder(),
            ),
            Expanded(
              child: Placeholder(),
            ),
          ],
        );
      }),
    );
  }
}
