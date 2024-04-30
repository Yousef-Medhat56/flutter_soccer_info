import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:soccer_info/models/league.dart';
import "package:dio/dio.dart";

part 'leagues_state.dart';
part 'leagues_cubit.freezed.dart';

class LeaguesDataCubit extends Cubit<LeaguesDataState> {
  LeaguesDataCubit() : super(const LeaguesDataState.initial());

  fetchMatches([String? date]) async {
    try {
      emit(const LeaguesDataState.loading());
      Dio dio = Dio();

      String url = date != null
          ? "https://soccer-info.vercel.app/api/matches?date=$date"
          : "https://soccer-info.vercel.app/api/matches";

      final res = await dio.get(url);
      if (res.statusCode == 200) {
        Map data = jsonDecode(res.data);

        List<LeagueModel> leaguesData = [];
        for (var league in data["data"]["allMatches"]) {
          LeagueModel matchesInLeague = LeagueModel.fromJson(league);
          leaguesData.add(matchesInLeague);
        }

        emit(LeaguesDataState.success(leaguesData));
      } else {
        emit(
          LeaguesDataState.error(
              "Error loading matches: ${res.data.toString()}"),
        );
      }
    } catch (e) {
      emit(
        LeaguesDataState.error("Error loading matches: ${e.toString()}"),
      );
    }
  }
}
