import 'package:flutter/material.dart';

class TeamTile extends StatelessWidget {
  final String teamName;
  final String teamImg;

  const TeamTile({super.key, required this.teamName, required this.teamImg});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(teamImg), fit: BoxFit.fitHeight)),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          teamName,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        )
      ],
    );
  }
}
