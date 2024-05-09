import 'package:flutter/material.dart';
import 'package:soccer_info/models/league.dart';

class ScorersList extends StatelessWidget {
  final List<Scorer>? scorers;
  final bool isAway;
  const ScorersList({super.key, this.scorers, required this.isAway});
  @override
  Widget build(BuildContext context) {
    return scorers != null
        ? Column(
            crossAxisAlignment:
                isAway ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: scorers!
                .map((scorer) => Row(
                      textDirection:
                          isAway ? TextDirection.ltr : TextDirection.rtl,
                      children: [
                        Text(
                          scorer.name,
                          style: TextStyle(
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text(scorer.time,
                            style: TextStyle(
                                color: Colors.green.shade300,
                                fontWeight: FontWeight.bold))
                      ],
                    ))
                .toList(),
          )
        : Container();
  }
}
