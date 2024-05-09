import 'package:flutter/material.dart';

class TeamTile extends StatelessWidget {
  final String teamName;
  final String teamImg;
  final double scale;

  const TeamTile({
    super.key,
    required this.teamName,
    required this.teamImg,
    this.scale = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 60 * scale,
          width: 60 * scale,
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
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12 * scale,
          ),
        )
      ],
    );
  }
}
