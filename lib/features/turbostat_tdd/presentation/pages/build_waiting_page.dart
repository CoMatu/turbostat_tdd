import 'package:flutter/material.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/custom_circle_progress_bar.dart';
import 'package:turbostat_tdd/features/turbostat_tdd/presentation/widgets/main_appbar.dart';

class BuildWaitingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        alignment: Alignment.center,
        child: CustomCircleProgressBar(),
      ),
    );
  }

}