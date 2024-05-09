import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final Widget child;
  const MainContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(99, 99, 99, 0.2),
            blurRadius: 8,
            spreadRadius: 0,
            offset: Offset(
              0,
              2,
            ),
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
