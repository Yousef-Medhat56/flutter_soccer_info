import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_info/cubits/match_overview/match_overview_cubit.dart';
import 'package:soccer_info/widgets/appbar.dart';
import 'package:soccer_info/widgets/container/main_container.dart';
import 'package:soccer_info/widgets/match_info_grid.dart';
import 'package:soccer_info/widgets/match_score.dart';
import 'package:soccer_info/widgets/scorers_list.dart';
import 'package:soccer_info/widgets/team_tile.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    String matchId = data["id"];

    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => MatchOverviewCubit())],
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(239, 241, 243, 1),
        appBar: const MyAppBar(),
        body: MainContainer(
          child: BlocBuilder<MatchOverviewCubit, MatchOverviewState>(
            builder: (context, state) {
              if (state == const MatchOverviewState.initial()) {
                context.read<MatchOverviewCubit>().fetchMatchOverview(matchId);
              }
              return state.when(
                initial: () {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green.shade300,
                    ),
                  );
                },
                loading: () {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.green.shade300,
                    ),
                  );
                },
                success: (data) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data.league.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: TeamTile(
                              scale: 1.2,
                              teamName: data.away.name,
                              teamImg: data.away.img,
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: MatchScoreVarient(
                              status: data.status,
                              homeGoals: data.home.goals,
                              awayGoals: data.away.goals,
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: TeamTile(
                              scale: 1.2,
                              teamName: data.home.name,
                              teamImg: data.home.img,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ScorersList(
                            isAway: true,
                            scorers: data.away.scorers,
                          ),
                          ScorersList(
                            isAway: false,
                            scorers: data.home.scorers,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Divider(),
                      MatchInfoGrid(info: data.info)
                    ],
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
