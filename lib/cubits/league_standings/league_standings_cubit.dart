import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_info/models/league_standings.dart';

part 'league_standings_state.dart';
part 'league_standings_cubit.freezed.dart';

class LeagueStandingsCubit extends Cubit<LeagueStandingsState> {
  LeagueStandingsCubit() : super(const LeagueStandingsState.initial());

  fetchStandings(String leagueId, String leagueSlug) async {
    try {
      emit(const LeagueStandingsState.loading());
      Dio dio = Dio();

      String url =
          "https://soccer-info.vercel.app/api/leagues/$leagueId/$leagueSlug/standings";

      final res = await dio.get(url);
      if (res.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(res.data)["data"];
        emit(LeagueStandingsState.success(LeagueStandings.fromJson(data)));
      } else if (res.statusCode == 404) {
        emit(const LeagueStandingsState.error("ترتيب الفرق غير متاح"));
      } else {
        emit(const LeagueStandingsState.error("ترتيب الفرق غير متاح"));
      }
    } catch (e) {
      emit(const LeagueStandingsState.error("ترتيب الفرق غير متاح"));
    }
  }
}
