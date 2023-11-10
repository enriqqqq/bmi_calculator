import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderCard extends StatelessWidget {
  final String value;
  final String imgUrl;
  final bool selected;
  final Function tapHandler;

  const GenderCard({
    required this.value,
    required this.imgUrl,
    required this.selected,
    required this.tapHandler,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: selected
            ? Border.all(
                width: 2,
                color: const Color.fromARGB(255, 214, 214, 214),
              )
            : null,
        borderRadius: BorderRadius.circular(10),
        color: selected
            ? const Color.fromARGB(255, 243, 243, 243)
            : const Color.fromARGB(255, 255, 255, 255),
      ),
      padding: const EdgeInsets.only(
          top: 40.0, left: 40.0, right: 40.0, bottom: 40.0),
      child: Column(
        children: [
          InkWell(
            onTap: () => tapHandler(value),
            child: Image.asset(
              imgUrl,
              width: 100,
              height: 100,
            ),
          ),
          selected
              ? Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  child: Text(
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 54, 54, 54),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
