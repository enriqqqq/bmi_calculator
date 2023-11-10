import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'header.dart';
import 'button.dart';

class Result extends StatelessWidget {
  final String bmi;
  final String bmiClass;
  final String bmiDescription;

  const Result({
    required this.bmi,
    required this.bmiClass,
    required this.bmiDescription,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color textColor;
    final String imgPath;
    if (bmiClass == 'Underweight') {
      textColor = const Color.fromARGB(255, 250, 232, 70);
      imgPath = 'assets/images/eating.jpg';
    } else if (bmiClass == 'Normal') {
      textColor = const Color.fromARGB(255, 70, 148, 73);
      imgPath = 'assets/images/meditate.jpg';
    } else if (bmiClass == 'Overweight') {
      textColor = const Color.fromARGB(255, 236, 149, 19);
      imgPath = 'assets/images/exercise.jpg';
    } else {
      textColor = const Color.fromARGB(255, 158, 33, 24);
      imgPath = 'assets/images/gym.jpg';
    }

    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: const Header(),
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'Result',
                      style: GoogleFonts.ptSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        bmi,
                        style: GoogleFonts.poppins(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          'kg/m²',
                          style: TextStyle(
                            fontSize: 18,
                            color: textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10.0),
                    child: Image.asset(
                      imgPath,
                      width: 350,
                      height: 350,
                    ),
                  ),
                  Text(
                    bmiClass,
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  SizedBox(
                    width: screenWidth < 600 ? 250 : 500,
                    child: Text(
                      bmiDescription,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Button(
                    text: 'Retry',
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
