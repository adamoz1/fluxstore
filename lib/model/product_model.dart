class ProductModel {
  String? name;
  String? description;
  double? price;
  String? imagePath;
  String? gender;
  String? category;
  bool? favoriate;

  ProductModel(
      String n, String d, double p, String i, String g, String c, bool f) {
    name = n;
    description = d;
    price = p;
    imagePath = i;
    gender = g;
    category = c;
    favoriate = f;
  }
}
