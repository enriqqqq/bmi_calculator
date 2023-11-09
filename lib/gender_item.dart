import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  final String value;
  final String imgUrl;
  final bool selected;
  final Function tapHandler;

  const GenderCard({
    required this.value,
    required this.imgUrl,
    required this.selected,
    required this.tapHandler,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: selected
            ? const Color.fromARGB(255, 220, 222, 223)
            : const Color.fromARGB(255, 255, 255, 255),
      ),
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () => tapHandler(value),
        child: Image.asset(
          imgUrl,
          width: 100,
          height: 100,
        ),
      ),
    );
  }
}