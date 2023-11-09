import 'package:flutter/material.dart';
import 'package:bmi_calculator/gender_item.dart';

class GenderSection extends StatelessWidget {
  final String gender;
  final Function setGender;

  const GenderSection({
    required this.gender,
    required this.setGender,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GenderCard(
            value: 'Male',
            imgUrl: 'assets/images/male.png',
            selected: gender == 'Male' ? true : false,
            tapHandler: setGender,
          ),
          GenderCard(
            value: 'Female',
            imgUrl: 'assets/images/female.png',
            selected: gender == 'Female' ? true : false,
            tapHandler: setGender,
          ),
        ],
      ),
    );
  }
}
