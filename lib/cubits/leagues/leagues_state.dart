part of 'leagues_cubit.dart';

@freezed
class LeaguesDataState with _$LeaguesDataState {
  const factory LeaguesDataState.initial() = _Initial;
  const factory LeaguesDataState.loading() = _Loading;
  const factory LeaguesDataState.success(List<LeagueModel> leagues) = _Success;
  const factory LeaguesDataState.error(String errorMessage) = _Error;
}
