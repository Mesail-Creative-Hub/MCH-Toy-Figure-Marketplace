class Brand {
  late int id;
  late String name;
  late String image;
  late String subImage;

  Brand(
      {required this.id,
      required this.name,
      required this.image,
      required this.subImage});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        subImage: json["subImage"]);
  }
}
