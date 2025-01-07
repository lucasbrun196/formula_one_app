import 'package:flutter_modular/flutter_modular.dart';
import 'package:tests/app/module/teams/presenter/teams_view.dart';

class TeamsModule extends Module {
  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => TeamsView(),
    );
  }
}
