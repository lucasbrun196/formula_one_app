import 'package:flutter/material.dart';
import 'package:tests/app/ui/wave_shape.dart';

class AppBarUi extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(120);

  const AppBarUi({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: const Color.fromARGB(255, 192, 64, 64),
      shape: WaveShape(),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: true,
    );
  }
}
