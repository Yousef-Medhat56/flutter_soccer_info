part of 'match_overview_cubit.dart';

@freezed
class MatchOverviewState with _$MatchOverviewState {
  const factory MatchOverviewState.initial() = _Initial;
  const factory MatchOverviewState.loading() = _Loading;
  const factory MatchOverviewState.success(MatchOverview data) = _Success;
  const factory MatchOverviewState.error(String errorMessage) = _Error;
}
