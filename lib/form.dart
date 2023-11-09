import 'package:flutter/material.dart';
import 'gender_item.dart';

class FormApp extends StatefulWidget {
  const FormApp({super.key});

  @override
  State createState() => _FormState();
}

class _FormState extends State<FormApp> {
  var gender = 'male';
  var height = 0.0;
  var weight = 0.0;

  void setGender(clickedGender) {
    setState(() {
      gender = clickedGender;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Input Your Data'),
        ),
        body: Container(
            child: Column(
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GenderCard(
                    value: 'male',
                    imgUrl: 'assets/images/male.png',
                    selected: gender == 'male' ? true : false,
                    tapHandler: setGender,
                  ),
                  GenderCard(
                    value: 'female',
                    imgUrl: 'assets/images/female.png',
                    selected: gender == 'female' ? true : false,
                    tapHandler: setGender,
                  ),
                ],
              ),
            ),
            Container(),
            Container(),
          ],
        )));
  }
}
