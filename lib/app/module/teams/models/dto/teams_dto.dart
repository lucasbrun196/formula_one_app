import 'dart:typed_data';

import 'package:tests/app/module/teams/models/entities/teams.dart';

class TeamsDto implements Teams {
  TeamsDto(
      {required this.id,
      required this.name,
      required this.country,
      required this.imageBytes});

  @override
  String country;

  @override
  int id;

  @override
  String name;

  @override
  List<int> imageBytes;

  factory TeamsDto.fromMap(Map<String, dynamic> map) {
    return TeamsDto(
      id: map["id"],
      name: map["name"],
      country: map["country"],
      imageBytes: map["imageBytesList"],
    );
  }
}
