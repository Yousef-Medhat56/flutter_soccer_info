import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_info/models/match_stats.dart';

part 'match_stats_state.dart';
part 'match_stats_cubit.freezed.dart';

class MatchStatsCubit extends Cubit<MatchStatsState> {
  MatchStatsCubit() : super(const MatchStatsState.initial());

  fetchMatchOverview(String matchId) async {
    try {
      emit(const MatchStatsState.loading());
      Dio dio = Dio();

      String url = "https://soccer-info.vercel.app/api/matches/$matchId/stats";

      final res = await dio.get(url);
      if (res.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(res.data)["data"];

        emit(MatchStatsState.success(MatchStats.fromJson(data)));
      } else if (res.statusCode == 404) {
        emit(const MatchStatsState.error("إحصائيات المباراة غير متاحة"));
      } else {
        emit(const MatchStatsState.error("إحصائيات المباراة غير متاحة"));
      }
    } catch (e) {
      emit(const MatchStatsState.error("إحصائيات المباراة غير متاحة"));
    }
  }
}
