import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WeightSection extends StatelessWidget {
  final double weight;
  final TextEditingController weightController;
  final Function onWeightTextChange;
  final Function onWeightAdd;
  final Function onWeightSubtract;

  const WeightSection({
    required this.weight,
    required this.weightController,
    required this.onWeightTextChange,
    required this.onWeightAdd,
    required this.onWeightSubtract,
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
      margin: const EdgeInsets.all(60.0),
      padding: const EdgeInsets.all(40.0),
      child: Column(children: [
        const Text('Weight', style: TextStyle(fontSize: 18)),
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
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 10.0),
              width: 50,
              child: TextField(
                textAlign: TextAlign.center,
                controller: weightController,
                onChanged: (value) => onWeightTextChange(value),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const Text('kg', style: TextStyle(fontSize: 18)),
            Container(
              margin: const EdgeInsets.only(left: 35.0),
              child: InkWell(
                onTap: () => onWeightAdd(),
                child: const Icon(
                  Icons.add_circle_outline,
                  size: 36,
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
