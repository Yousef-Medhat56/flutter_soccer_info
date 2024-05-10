import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/src/intl/date_format.dart';
import 'package:soccer_info/cubits/leagues/leagues_cubit.dart';
import 'package:soccer_info/widgets/appbar.dart';
import 'package:soccer_info/widgets/container/home_screen_container.dart';
import 'package:soccer_info/widgets/league_tile.dart';
import 'package:soccer_info/widgets/loading_spinner.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String leagueValue = "الكل";
  DateTime shownDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaguesDataCubit(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(239, 241, 243, 1),
        appBar: const MyAppBar(),
        body: BlocBuilder<LeaguesDataCubit, LeaguesDataState>(
          builder: (context, state) {
            void selectLeagueHandler(String? newValue) {
              setState(
                () {
                  leagueValue = newValue!;
                },
              );
            }

            //onTap on a day in the days scroll widget
            void onTapDayHandler(String date) {
              setState(() {
                shownDay = DateFormat("y-M-d").parse(date);
                leagueValue = "الكل";
              });
              context.read<LeaguesDataCubit>().fetchMatches(date);
            }

            void onPickDayHandler(DateTime date) {
              setState(() {
                shownDay = date;
                leagueValue = "الكل";
              });
              if (!context.mounted) return;
              context.read<LeaguesDataCubit>().fetchMatches(
                    DateFormat("y-M-d").format(date),
                  );
            }

            if (state == const LeaguesDataState.initial()) {
              context.read<LeaguesDataCubit>().fetchMatches();
            }

            return state.when(
              initial: () {
                List<String> leagueNames = ["الكل"];

                return HomeScreenContainer(
                    leagueValue: leagueValue,
                    leagueNames: leagueNames,
                    selectLeagueHandler: selectLeagueHandler,
                    shownDay: shownDay,
                    onPickDayHandler: onPickDayHandler,
                    onTapDayHandler: onTapDayHandler,
                    child: const LoadingSpinner(height: 300));
              },
              loading: () {
                List<String> leagueNames = ["الكل"];

                return HomeScreenContainer(
                  leagueValue: leagueValue,
                  leagueNames: leagueNames,
                  selectLeagueHandler: selectLeagueHandler,
                  shownDay: shownDay,
                  onPickDayHandler: onPickDayHandler,
                  onTapDayHandler: onTapDayHandler,
                  child: const LoadingSpinner(height: 300),
                );
              },
              error: ((errorMessage) => Center(
                    child: Text(errorMessage),
                  )),
              success: (leagues) {
                List<String> leagueNames = ["الكل"];
                for (var league in leagues) {
                  leagueNames.add(league.leagueName);
                }

                return HomeScreenContainer(
                  leagueValue: leagueValue,
                  leagueNames: leagueNames,
                  selectLeagueHandler: selectLeagueHandler,
                  shownDay: shownDay,
                  onPickDayHandler: onPickDayHandler,
                  onTapDayHandler: onTapDayHandler,
                  child: leagues.isNotEmpty
                      ? ListView.builder(
                          itemCount: leagues.length,
                          itemBuilder: (context, index) {
                            return (leagueValue == "الكل" ||
                                    leagues[index].leagueName == leagueValue)
                                ? LeagueTile(league: leagues[index])
                                : Container();
                          },
                        )
                      : const Center(child: Text("لا يوجد مباريات")),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
