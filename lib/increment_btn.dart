import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IncrementButton extends StatelessWidget {
  final double value;
  final double currIncrement;
  final Function tapHandler;

  const IncrementButton({
    required this.value,
    required this.currIncrement,
    required this.tapHandler,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
      alignment: Alignment.center,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: currIncrement == value
            ? const Color.fromARGB(255, 140, 114, 185)
            : const Color.fromARGB(255, 179, 147, 236),
        shape: BoxShape.circle,
        border: Border.all(
          width: 2,
          color: const Color.fromARGB(255, 140, 114, 185),
        ),
      ),
      child: InkWell(
        onTap: () => tapHandler(value),
        child: Text(
          value.toString(),
          style: GoogleFonts.ptSans(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
