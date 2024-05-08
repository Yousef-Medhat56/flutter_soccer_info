import 'package:flutter/material.dart';

class LeaguesDropdownButton extends StatelessWidget {
  final String leagueValue;
  final List<String> leagueNames;
  final void Function(String? newValue) selectLeagueHandler;
  const LeaguesDropdownButton(
      {super.key,
      required this.selectLeagueHandler,
      required this.leagueValue,
      required this.leagueNames});

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: leagueValue,
      items: leagueNames.map((leagueName) {
        return DropdownMenuItem(
          value: leagueName,
          child: Text(
            leagueName,
            overflow: TextOverflow.ellipsis,
          ),
        );
      }).toList(),
      onChanged: (String? newValue) => selectLeagueHandler(newValue),
    );
  }
}
