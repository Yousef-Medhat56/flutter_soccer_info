import 'package:flutter/material.dart';
import 'package:soccer_info/widgets/container/main_container.dart';
import 'package:soccer_info/widgets/date_picker.dart';
import 'package:soccer_info/widgets/days_scroll.dart';
import 'package:soccer_info/widgets/leagues_dropdown.dart';

class HomeScreenContainer extends StatelessWidget {
  final Widget child;
  final String leagueValue;

  final List<String> leagueNames;
  final void Function(String? newValue) selectLeagueHandler;

  final DateTime shownDay;

  final void Function(DateTime date) onPickDayHandler;
  final void Function(String date) onTapDayHandler;

  const HomeScreenContainer({
    super.key,
    required this.child,
    required this.leagueValue,
    required this.leagueNames,
    required this.selectLeagueHandler,
    required this.shownDay,
    required this.onPickDayHandler,
    required this.onTapDayHandler,
  });

  @override
  Widget build(BuildContext context) {
    return MainContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "المباريات",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: LeaguesDropdownButton(
                      leagueValue: leagueValue,
                      leagueNames: leagueNames,
                      selectLeagueHandler: selectLeagueHandler,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  DatePicker(
                    shownDay: shownDay,
                    onPickDayHandler: onPickDayHandler,
                  )
                ],
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 60,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey.shade300),
              ),
            ),
            child: DaysScroll(
              shownDay: shownDay,
              onTapDayHandler: onTapDayHandler,
            ),
          ),
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
