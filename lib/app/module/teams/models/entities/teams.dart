class Teams {
  Teams(
      {required this.id,
      required this.name,
      required this.country,
      required this.imageBytes});
  int id;
  String name;
  String country;
  List<int> imageBytes;
}
