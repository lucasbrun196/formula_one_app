import 'package:flutter_modular/flutter_modular.dart';
import 'package:tests/app/module/teams/teams_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.module(
      '/',
      module: TeamsModule(),
    );
  }
}
