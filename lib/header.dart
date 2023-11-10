import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0,
      backgroundColor: const Color.fromARGB(255, 198, 179, 230),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15.0),
        ),
      ),
      flexibleSpace: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('BMI', style: GoogleFonts.bangers(fontSize: 36)),
            Text(
              'Calculator',
              style: GoogleFonts.notoSansLinearB(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
