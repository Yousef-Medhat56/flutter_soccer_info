import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  final double height;
  const LoadingSpinner({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Center(
        child: CircularProgressIndicator(
          color: Colors.green.shade300,
        ),
      ),
    );
  }
}
