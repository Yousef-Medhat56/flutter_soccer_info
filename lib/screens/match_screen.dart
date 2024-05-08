import 'package:flutter/material.dart';
import 'package:soccer_info/widgets/appbar.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    String matchId = data["id"];

    return Scaffold(
      backgroundColor: const Color.fromRGBO(239, 241, 243, 1),
      appBar: const MyAppBar(),
    );
  }
}
