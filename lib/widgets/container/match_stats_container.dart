import 'package:flutter/material.dart';

class MatchStatsContainer extends StatelessWidget {
  final Widget child;
  const MatchStatsContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        const Text(
          "الإحصائيات",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        child
      ],
    );
  }
}
