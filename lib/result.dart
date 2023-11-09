import 'package:flutter/material.dart';
import 'header.dart';

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
    return Scaffold(
      appBar: const Header(),
      body: Center(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(20.0),
          margin: const EdgeInsets.only(bottom: 60.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0),
                child: const Text(
                  'Result',
                  style: TextStyle(
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
                    style: const TextStyle(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: const Text(
                      'kg/m²',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              Text(
                bmiClass,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(bmiDescription),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Container(
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
                    'Retry',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
