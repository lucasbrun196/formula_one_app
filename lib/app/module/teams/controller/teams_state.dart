part of 'teams_controller.dart';

enum TeamsStatus { inital, loading, success, error }

class TeamsState extends Equatable {
  final TeamsStatus teamsStatus;
  final String? errorMessage;
  final List<Teams>? teams;
  final List<int>? imagesBufferList;
  const TeamsState(
      {required this.teamsStatus,
      this.errorMessage,
      this.teams,
      this.imagesBufferList});

  @override
  List<Object?> get props =>
      [teamsStatus, teams, errorMessage, imagesBufferList];

  const TeamsState.inital() : this(teamsStatus: TeamsStatus.inital);

  TeamsState copyWith({
    TeamsStatus? teamsStatus,
    String? errorMessage,
    List<Teams>? teams,
    List<int>? imagesBufferList,
  }) {
    return TeamsState(
      teamsStatus: teamsStatus ?? this.teamsStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      teams: teams ?? this.teams,
      imagesBufferList: imagesBufferList ?? this.imagesBufferList,
    );
  }
}
