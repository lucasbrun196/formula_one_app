import 'dart:typed_data';

import 'package:http/http.dart';
import 'dart:convert';

import 'package:tests/app/module/teams/models/dto/teams_dto.dart';
import 'package:tests/app/module/teams/models/entities/teams.dart';

class TeamsDatasource {
  Future<List<Teams>> getTeams() async {
    List<Teams> teamsList = [];
    String url = "http://192.168.0.173:3333/teams";
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      for (int i = 0; i < mapResponse["teams"].length; i++) {
        Map<String, dynamic> mapTeamAux = mapResponse["teams"][i];
        List<dynamic> imageBytesList = await getImageBuffer(mapTeamAux["name"]);
        mapTeamAux.addAll({"imageBytesList": imageBytesList});
        mapResponse["teams"][i] = mapTeamAux;
      }
      for (dynamic dn in mapResponse["teams"]) {
        Teams team = TeamsDto.fromMap(dn);
        teamsList.add(team);
      }
    }
    return teamsList;
  }

  Future<List<dynamic>> getImageBuffer(String name) async {
    name = name.toLowerCase().replaceAll(" ", "-");
    List<int> imageBytes = [];
    String url = "http://192.168.0.173:3333/images/${name}";
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      imageBytes = response.bodyBytes;
    }
    return imageBytes;
  }
}
