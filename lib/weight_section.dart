import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'increment_btn.dart';

class WeightSection extends StatelessWidget {
  final double weight;
  final TextEditingController weightController;
  final Function onWeightTextChange;
  final Function onWeightAdd;
  final Function onWeightSubtract;
  final double increment;
  final Function setIncrement;
  final FocusNode focusNode;

  const WeightSection({
    required this.weight,
    required this.weightController,
    required this.focusNode,
    required this.onWeightTextChange,
    required this.onWeightAdd,
    required this.onWeightSubtract,
    required this.increment,
    required this.setIncrement,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 900,
          ),
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
          margin: screenWidth < 600
              ? const EdgeInsets.only(top: 40.0, left: 25.0, right: 25.0)
              : const EdgeInsets.only(top: 40.0, left: 60.0, right: 60.0),
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Text(
                'Weight',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 35.0),
                    child: InkWell(
                      onTap: () => onWeightSubtract(),
                      child: const Icon(
                        Icons.remove_circle_outline,
                        size: 36,
                        color: Color.fromARGB(255, 184, 184, 184),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 10.0),
                    width: 50,
                    child: TextField(
                      style: GoogleFonts.ptSans(),
                      textAlign: TextAlign.center,
                      controller: weightController,
                      focusNode: focusNode,
                      onEditingComplete: () => onWeightTextChange(),
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]+'))
                      ],
                    ),
                  ),
                  Text('kg', style: GoogleFonts.ptSans(fontSize: 14)),
                  Container(
                    margin: const EdgeInsets.only(left: 35.0),
                    child: InkWell(
                      onTap: () => onWeightAdd(),
                      child: const Icon(
                        Icons.add_circle_outline,
                        size: 36,
                        color: Color.fromARGB(255, 184, 184, 184),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IncrementButton(
                      value: 0.1,
                      currIncrement: increment,
                      tapHandler: (value) => setIncrement(value),
                    ),
                    IncrementButton(
                      value: 0.5,
                      currIncrement: increment,
                      tapHandler: (value) => setIncrement(value),
                    ),
                    IncrementButton(
                      value: 1,
                      currIncrement: increment,
                      tapHandler: (value) => setIncrement(value),
                    ),
                    IncrementButton(
                      value: 5,
                      currIncrement: increment,
                      tapHandler: (value) => setIncrement(value),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
