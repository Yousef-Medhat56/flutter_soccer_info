part of 'match_stats_cubit.dart';

@freezed
class MatchStatsState with _$MatchStatsState {
  const factory MatchStatsState.initial() = _Initial;
  const factory MatchStatsState.loading() = _Loading;
  const factory MatchStatsState.success(MatchStats data) = _Success;
  const factory MatchStatsState.error(String errorMessage) = _Error;
}
