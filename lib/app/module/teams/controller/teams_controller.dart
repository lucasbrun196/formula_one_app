import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tests/app/module/teams/models/datasource/teams_datasource.dart';

import '../models/entities/teams.dart';
part 'teams_state.dart';

class TeamsController extends Cubit<TeamsState> {
  final TeamsDatasource teamsDatasource;
  TeamsController({required this.teamsDatasource})
      : super(const TeamsState.inital());

  Future<void> getAllTeams() async {
    emit(state.copyWith(teamsStatus: TeamsStatus.loading));
    try {
      final teams = await teamsDatasource.getTeams();
      emit(state.copyWith(teamsStatus: TeamsStatus.success, teams: teams));
    } catch (e) {
      emit(
          state.copyWith(teamsStatus: TeamsStatus.error, errorMessage: "Erro"));
    }
  }
}
