import 'package:flutter/material.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      flexibleSpace: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('BMI', style: TextStyle(fontSize: 38)),
            Text('Calculator', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
