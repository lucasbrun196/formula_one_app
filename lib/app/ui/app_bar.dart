import 'package:flutter/material.dart';
import 'package:tests/app/ui/wave_shape.dart';

class AppBarUi extends StatefulWidget {
  final String title;

  const AppBarUi({super.key, required this.title});

  @override
  State<AppBarUi> createState() => _AppBarUiState();
}

class _AppBarUiState extends State<AppBarUi> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      backgroundColor: Colors.redAccent,
      shape: WaveShape(),
      title: Text(
        widget.title,
        style: TextStyle(fontFamily: 'Montserrat'),
      ),
      centerTitle: true,
      floating: false,
    );
  }
}
