part of 'league_standings_cubit.dart';

@freezed
class LeagueStandingsState with _$LeagueStandingsState {
  const factory LeagueStandingsState.initial() = _Initial;
  const factory LeagueStandingsState.loading() = _Loading;
  const factory LeagueStandingsState.success(LeagueStandings data) = _Success;
  const factory LeagueStandingsState.error(String errorMessage) = _Error;
}
