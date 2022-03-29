import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Function onPress;
  const CustomButton({
    Key? key,
    required this.buttonColor,
    required this.buttonText,
    required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPress(),
      child: Material(
        elevation: 15,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ),
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
