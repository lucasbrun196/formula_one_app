import 'package:flutter_modular/flutter_modular.dart';
import 'package:tests/app/module/teams/controller/teams_controller.dart';
import 'package:tests/app/module/teams/models/datasource/teams_datasource.dart';
import 'package:tests/app/module/teams/views/teams_view.dart';

class TeamsModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton(TeamsDatasource.new);
    i.addLazySingleton(TeamsController.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => TeamsView(
        controller: Modular.get(),
      ),
    );
  }
}
