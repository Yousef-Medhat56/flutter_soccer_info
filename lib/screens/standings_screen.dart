import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_info/cubits/league_standings/league_standings_cubit.dart';
import 'package:soccer_info/widgets/container/main_container.dart';
import 'package:soccer_info/widgets/loading_spinner.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

class StandingsScreen extends StatelessWidget {
  const StandingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;

    String leagueId = data["leagueId"];
    String leagueSlug = data["leagueSlug"];
    String leagueName = data["leagueName"];

    return BlocProvider(
      create: (context) => LeagueStandingsCubit(),
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(239, 241, 243, 1),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            leagueName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: MainContainer(
          child: BlocBuilder<LeagueStandingsCubit, LeagueStandingsState>(
            builder: (context, state) {
              if (state == const LeagueStandingsState.initial()) {
                context
                    .read<LeagueStandingsCubit>()
                    .fetchStandings(leagueId, leagueSlug);
              }
              return state.when(
                initial: () {
                  return const LoadingSpinner(height: 300);
                },
                loading: () {
                  return const LoadingSpinner(height: 300);
                },
                success: (data) {
                  const double ROW_HEIGHT = 56;
                  const double ROW_PADDING = 3;
                  const double HEADER_HEIGHT = 60;
                  return ListView(
                    children: data.groups
                        .map(
                          (group) => SizedBox(
                            height: (data.groups[0].standings.length *
                                    (ROW_HEIGHT + ROW_PADDING)) +
                                HEADER_HEIGHT,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: ScrollableTableView(
                                headerHeight: HEADER_HEIGHT,
                                headers: [
                                  group.groupName != "\n"
                                      ? group.groupName
                                      : "              ",
                                  "لعب",
                                  "النقط",
                                  "فوز",
                                  "تعادل",
                                  "خسارة",
                                  "له",
                                  "عليه",
                                  "الفرق",
                                ].map((label) {
                                  return TableViewHeader(
                                    label: label!,
                                  );
                                }).toList(),
                                rows: group.standings.map((team) {
                                  return TableViewRow(
                                    height: ROW_HEIGHT,
                                    cells: [
                                      TableViewCell(
                                        child: Row(
                                          children: [
                                            Text(
                                              "${team.order} ",
                                              style: TextStyle(
                                                  color: Colors.green.shade300),
                                            ),
                                            Container(
                                              height: 28,
                                              width: 28,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        team.teamData.img,
                                                      ),
                                                      fit: BoxFit.fitHeight)),
                                            ),
                                            Expanded(
                                              child: Text(
                                                " ${team.teamData.name}",
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      ...[
                                        team.matchesPlayed,
                                        team.points,
                                        team.wins,
                                        team.draws,
                                        team.losses,
                                        team.goalsFor,
                                        team.goalsAgainst,
                                        team.goalsDiff
                                      ].map((value) {
                                        return TableViewCell(
                                            child: Text("$value"));
                                      })
                                    ],
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  );
                },
                error: ((errorMessage) => Center(
                      child: Text(errorMessage),
                    )),
              );
            },
          ),
        ),
      ),
    );
  }
}
