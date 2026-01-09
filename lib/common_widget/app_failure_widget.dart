import 'package:flutter/material.dart';

class AppFailureWidget extends StatelessWidget {
  final String? message;
  final VoidCallback onPressed;
  const AppFailureWidget({
    super.key,
    required this.message,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message ?? 'Failed to load , check your internet connection'),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: onPressed, child: Text('Retry')),
        ],
      ),
    );
  }
}

