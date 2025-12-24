import 'package:flutter/material.dart';

class CommonElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CommonElevatedButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:null,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
