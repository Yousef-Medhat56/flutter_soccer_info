import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soccer_info/models/match_overview.dart';

part 'match_overview_state.dart';
part 'match_overview_cubit.freezed.dart';

class MatchOverviewCubit extends Cubit<MatchOverviewState> {
  MatchOverviewCubit() : super(const MatchOverviewState.initial());

  fetchMatchOverview(String matchId) async {
    try {
      emit(const MatchOverviewState.loading());
      Dio dio = Dio();

      String url =
          "https://soccer-info.vercel.app/api/matches/$matchId/results";

      final res = await dio.get(url);

      if (res.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(res.data)["data"];

        emit(MatchOverviewState.success(MatchOverview.fromJson(data)));
      } else {
        emit(
          MatchOverviewState.error(
              "Error loading match overview: ${res.data.toString()}"),
        );
      }
    } catch (e) {
      emit(
        MatchOverviewState.error(
            "Error loading match overview: ${e.toString()}"),
      );
    }
  }
}
