import 'package:flutter/material.dart';
import 'gender_section.dart';
import 'height_section.dart';
import 'weight_section.dart';
import 'result.dart';
import 'button.dart';

class FormApp extends StatefulWidget {
  const FormApp({super.key});

  @override
  State createState() => _FormState();
}

class _FormState extends State<FormApp> {
  var gender = 'Male';
  double height = 165;
  double weight = 50;
  double weightIncrement = 1.0;

  final heightController = TextEditingController();
  final weightController = TextEditingController();

  final heightFocusNode = FocusNode();
  final weightFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    heightFocusNode.addListener(() {
      if (!heightFocusNode.hasFocus) {
        onHeightTextChange();
      }
    });

    weightFocusNode.addListener(() {
      if (!weightFocusNode.hasFocus) {
        onWeightTextChange();
      }
    });
  }

  void setGender(clickedGender) {
    setState(() {
      gender = clickedGender;
    });
  }

  void onHeightTextChange() {
    double newValue;
    try {
      newValue = double.parse(heightController.text);
    } catch (err) {
      newValue = 1.0;
    }
    if (newValue > 260) {
      newValue = 260.0;
    }
    if (newValue < 1 || newValue.isNaN) {
      newValue = 1.0;
    }

    heightController.text = newValue.toStringAsFixed(1);
    setState(() {
      height = newValue;
    });

    heightFocusNode.unfocus();
  }

  void onHeightSliderChange(value) {
    setState(() {
      height = value;
      heightController.text = value.toStringAsFixed(1);
    });
  }

  void onWeightTextChange() {
    double newValue;
    try {
      newValue = double.parse(weightController.text);
    } catch (err) {
      newValue = 1.0;
    }

    if (newValue < 1 || newValue.isNaN) {
      newValue = 1.0;
    }

    weightController.text = newValue.toString();
    setState(() {
      weight = newValue;
    });

    weightFocusNode.unfocus();
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

  void setIncrement(value) {
    setState(() {
      weightIncrement = value;
    });
  }

  void submit() {
    if (weightFocusNode.hasFocus || heightFocusNode.hasFocus) {
      return;
    }

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
        bmiDescription =
            'You are underweight. Remember that nourishing your body is crucial. Make sure to eat more!';
      } else if (bmi >= 18 && bmi < 25) {
        bmiClass = 'Normal';
        bmiDescription = 'You are have a normal BMI. Good job and keep it up!';
      } else if (bmi >= 25 && bmi <= 27) {
        bmiClass = 'Overweight';
        bmiDescription =
            'It seems like you are overweight. You need to exercise.';
      } else {
        bmiClass = 'Obese';
        bmiDescription =
            'Oh no! You are obese. Don\'t lose hope yet! You need to exercise more and keep a healthy diet.';
      }
    } else {
      if (bmi < 17) {
        bmiClass = 'Underweight';
        bmiDescription =
            'You are underweight. Remember that nourishing your body is crucial. Make sure to eat more!';
      } else if (bmi >= 17 && bmi < 23) {
        bmiClass = 'Normal';
        bmiDescription = 'You are have a normal BMI. Good job and keep it up!';
      } else if (bmi >= 23 && bmi <= 27) {
        bmiClass = 'Overweight';
        bmiDescription =
            'It seems like you are overweight. You need to exercise.';
      } else {
        bmiClass = 'Obese';
        bmiDescription =
            'Oh no! You are obese. Don\'t lose hope yet! You need to exercise more and keep a healthy diet.';
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
              focusNode: heightFocusNode,
              heightController: heightController,
              onHeightTextChange: onHeightTextChange,
              onHeightSliderChange: onHeightSliderChange,
            ),
            WeightSection(
              weight: weight,
              focusNode: weightFocusNode,
              weightController: weightController,
              onWeightTextChange: onWeightTextChange,
              onWeightAdd: onWeightAdd,
              onWeightSubtract: onWeightSubtract,
              increment: weightIncrement,
              setIncrement: setIncrement,
            ),
            Button(
              text: 'Calculate',
              onPressed: submit,
            )
          ],
        ),
      ),
    );
  }
}
