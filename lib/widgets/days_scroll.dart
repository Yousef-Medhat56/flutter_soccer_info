import 'package:flutter/material.dart';
import 'package:soccer_info/utils/date_utils.dart';

class DaysScroll extends StatelessWidget {
  final DateTime shownDay;
  final void Function(String date) onTapDayHandler;
  const DaysScroll(
      {super.key, required this.onTapDayHandler, required this.shownDay});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeekDays(shownDay),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                onTapDayHandler(snapshot.data![index].api);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: (index == 2)
                    ? BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              color: Colors.green.shade300, width: 2),
                        ),
                      )
                    : null,
                child: Center(
                  child: Text(
                    snapshot.data![index].show,
                    style: TextStyle(
                        color: (index == 2)
                            ? Colors.green.shade300
                            : Colors.grey.shade600),
                  ),
                ),
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
