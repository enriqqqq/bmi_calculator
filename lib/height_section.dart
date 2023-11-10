import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightSection extends StatelessWidget {
  final TextEditingController heightController;
  final Function onHeightSliderChange;
  final Function onHeightTextChange;
  final double height;
  final FocusNode focusNode;

  const HeightSection({
    required this.heightController,
    required this.onHeightTextChange,
    required this.onHeightSliderChange,
    required this.height,
    required this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 2.0), // shadow direction: bottom center
            blurRadius: 5.0, // blur radius
            spreadRadius: 1.0, // spread radius
          ),
        ],
      ),
      margin: const EdgeInsets.only(top: 40.0, left: 60.0, right: 60.0),
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          Text(
            'Height',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                width: 50,
                child: TextField(
                  style: GoogleFonts.ptSans(),
                  textAlign: TextAlign.center,
                  controller: heightController,
                  focusNode: focusNode,
                  onEditingComplete: () => onHeightTextChange(),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]+'))
                  ],
                ),
              ),
              Text('cm', style: GoogleFonts.ptSans(fontSize: 14)),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 20.0),
            child: SliderTheme(
              data: const SliderThemeData(
                trackHeight: 5,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 10),
              ),
              child: Slider(
                value: height,
                min: 1,
                max: 260,
                divisions: 2600,
                label: height.toStringAsFixed(1),
                onChanged: (double value) => onHeightSliderChange(value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
