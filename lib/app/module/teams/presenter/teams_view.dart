import 'package:flutter/material.dart';
import 'package:tests/app/ui/app_bar.dart';

class TeamsView extends StatelessWidget {
  const TeamsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarUi(
          title: 'Formula One Teams',
        ),
      ),
    );
  }
}
