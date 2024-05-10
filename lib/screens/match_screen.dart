import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_info/cubits/match_overview/match_overview_cubit.dart';
import 'package:soccer_info/cubits/match_stats/match_stats_cubit.dart';
import 'package:soccer_info/widgets/appbar.dart';
import 'package:soccer_info/widgets/container/main_container.dart';
import 'package:soccer_info/widgets/container/match_overview_container.dart';
import 'package:soccer_info/widgets/container/match_statbars_container.dart';
import 'package:soccer_info/widgets/container/match_stats_container.dart';

class MatchScreen extends StatelessWidget {
  const MatchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    String matchId = data["id"];

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MatchOverviewCubit()),
        BlocProvider(create: (context) => MatchStatsCubit())
      ],
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(239, 241, 243, 1),
        appBar: const MyAppBar(),
        body: SingleChildScrollView(
          child: MainContainer(
            child: Column(
              children: [
                BlocBuilder<MatchOverviewCubit, MatchOverviewState>(
                  builder: (context, state) {
                    if (state == const MatchOverviewState.initial()) {
                      context
                          .read<MatchOverviewCubit>()
                          .fetchMatchOverview(matchId);
                    }
                    return state.when(
                      initial: () {
                        return SizedBox(
                          height: 300,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.green.shade300,
                            ),
                          ),
                        );
                      },
                      loading: () {
                        return SizedBox(
                          height: 300,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.green.shade300,
                            ),
                          ),
                        );
                      },
                      success: (data) {
                        return MatchOverviewContainer(data: data);
                      },
                      error: ((errorMessage) => Center(
                            child: Text(errorMessage),
                          )),
                    );
                  },
                ),
                BlocBuilder<MatchStatsCubit, MatchStatsState>(
                  builder: (context, state) {
                    if (state == const MatchStatsState.initial()) {
                      context
                          .read<MatchStatsCubit>()
                          .fetchMatchOverview(matchId);
                    }
                    return state.when(
                      initial: () {
                        return MatchStatsContainer(
                          child: SizedBox(
                            height: 60,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.green.shade300,
                              ),
                            ),
                          ),
                        );
                      },
                      loading: () {
                        return MatchStatsContainer(
                          child: SizedBox(
                            height: 60,
                            child: Center(
                              child: CircularProgressIndicator(
                                color: Colors.green.shade300,
                              ),
                            ),
                          ),
                        );
                      },
                      success: (data) {
                        return MatchStatsContainer(
                          child: MatchStatBarsContainer(data: data),
                        );
                      },
                      error: ((errorMessage) => MatchStatsContainer(
                            child: Center(
                              child: Text(errorMessage),
                            ),
                          )),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
