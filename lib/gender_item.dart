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
    var screenWidth = MediaQuery.of(context).size.width;

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
      padding: screenWidth < 600
          ? const EdgeInsets.all(35.0)
          : const EdgeInsets.all(40.0),
      child: Column(
        children: [
          InkWell(
            onTap: () => tapHandler(value),
            child: Image.asset(
              imgUrl,
              width: screenWidth < 600 ? 80 : 100,
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
