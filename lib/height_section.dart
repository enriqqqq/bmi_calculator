import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HeightSection extends StatelessWidget {
  final TextEditingController heightController;
  final Function onHeightSliderChange;
  final Function onHeightTextChange;
  final double height;

  const HeightSection({
    required this.heightController,
    required this.onHeightTextChange,
    required this.onHeightSliderChange,
    required this.height,
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
      margin: const EdgeInsets.only(top: 60.0, left: 60.0, right: 60.0),
      padding: const EdgeInsets.all(40.0),
      child: Column(
        children: [
          const Text(
            'Height',
            style: TextStyle(fontSize: 18),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10.0),
                width: 50,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: heightController,
                  onChanged: (value) => onHeightTextChange(value),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              const Text('cm', style: TextStyle(fontSize: 18)),
            ],
          ),
          Slider(
            value: height,
            min: 1,
            max: 260,
            divisions: 2600,
            label: height.toStringAsFixed(1),
            onChanged: (double value) => onHeightSliderChange(value),
          ),
        ],
      ),
    );
  }
}
