class Figure {
  late int id;
  late String image;
  late String title;
  late String description;
  late String price;
  late int brandId;
  bool isFavorite = false;

  Figure(
      {required this.id,
      required this.image,
      required this.title,
      required this.description,
      required this.price,
      required this.brandId});

  factory Figure.fromJson(Map<String, dynamic> json) {
    return Figure(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        description: json["description"],
        price: json["price"],
        brandId: json["brand_id"]);
  }
}
