import 'package:flutter/material.dart';
import 'gender_section.dart';
import 'height_section.dart';
import 'weight_section.dart';
import 'result.dart';

class FormApp extends StatefulWidget {
  const FormApp({super.key});

  @override
  State createState() => _FormState();
}

class _FormState extends State<FormApp> {
  var gender = 'Male';
  double height = 165.0;
  double weight = 50.0;
  double weightIncrement = 1.0;

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  void setGender(clickedGender) {
    setState(() {
      gender = clickedGender;
    });
  }

  void onHeightTextChange(value) {
    double newValue;
    try {
      newValue = double.parse(value);
    } catch (err) {
      newValue = 1.0;
    }
    if (newValue > 260) {
      newValue = 260;
    }
    if (newValue < 1 || newValue.isNaN) {
      newValue = 1.0;
    }

    heightController.text = newValue.toStringAsFixed(1);
    setState(() {
      height = newValue;
    });
  }

  void onHeightSliderChange(value) {
    setState(() {
      height = value;
      heightController.text = value.toStringAsFixed(1);
    });
  }

  void onWeightTextChange(value) {
    double newValue;
    try {
      newValue = double.parse(value);
    } catch (err) {
      newValue = 1.0;
    }

    if (newValue < 1 || newValue.isNaN) {
      newValue = 1.0;
    }

    weightController.text = newValue.toStringAsFixed(1);
    setState(() {
      weight = newValue;
    });
  }

  void onWeightAdd() {
    double newWeight = weight + weightIncrement;

    weightController.text = newWeight.toStringAsFixed(1);
    setState(() {
      weight = newWeight;
    });
  }

  void onWeightSubtract() {
    double newWeight = weight - weightIncrement;

    if (newWeight < 1) {
      newWeight = 1;
    }

    weightController.text = newWeight.toStringAsFixed(1);
    setState(() {
      weight = newWeight;
    });
  }

  void submit() {
    final double bmi;
    try {
      final heightInMeter = height / 100;
      bmi = weight / (heightInMeter * heightInMeter);
    } catch (err) {
      return;
    }

    final String bmiClass;
    final String bmiDescription;

    if (gender == 'Male') {
      if (bmi < 18) {
        bmiClass = 'Underweight';
        bmiDescription = 'You are underweight. You need to eat more.';
      } else if (bmi >= 18 && bmi < 25) {
        bmiClass = 'Normal';
        bmiDescription = 'You are normal. Good job!';
      } else if (bmi >= 25 && bmi <= 27) {
        bmiClass = 'Overweight';
        bmiDescription = 'You are overweight. You need to exercise more.';
      } else {
        bmiClass = 'Obese';
        bmiDescription = 'You are obese. You need to exercise more.';
      }
    } else {
      if (bmi < 17) {
        bmiClass = 'Underweight';
        bmiDescription = 'You are underweight. You need to eat more.';
      } else if (bmi >= 17 && bmi < 23) {
        bmiClass = 'Normal';
        bmiDescription = 'You are normal. Good job!';
      } else if (bmi >= 23 && bmi <= 27) {
        bmiClass = 'Overweight';
        bmiDescription = 'You are overweight. You need to exercise more.';
      } else {
        bmiClass = 'Obese';
        bmiDescription = 'You are obese. You need to exercise more.';
      }
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => Result(
          bmi: bmi.toStringAsFixed(1),
          bmiClass: bmiClass,
          bmiDescription: bmiDescription,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    heightController.text = height.toStringAsFixed(1);
    weightController.text = weight.toStringAsFixed(1);

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            GenderSection(
              gender: gender,
              setGender: setGender,
            ),
            HeightSection(
              height: height,
              heightController: heightController,
              onHeightTextChange: onHeightTextChange,
              onHeightSliderChange: onHeightSliderChange,
            ),
            WeightSection(
              weight: weight,
              weightController: weightController,
              onWeightTextChange: onWeightTextChange,
              onWeightAdd: onWeightAdd,
              onWeightSubtract: onWeightSubtract,
            ),
            TextButton(
              onPressed: submit,
              child: Container(
                margin: const EdgeInsets.only(bottom: 20.0),
                padding: const EdgeInsets.only(
                  top: 10.0,
                  bottom: 10.0,
                  left: 30.0,
                  right: 30.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
                child: const Text(
                  'Calculate',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
