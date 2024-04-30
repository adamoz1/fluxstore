/* 
Written by: Adarsh Patel
Modified At: 22-04-24
Description: Product Model of related fields.
*/

class ProductModel {
  String? name;
  String? description;
  double? price;
  String? imagePath;
  String? gender;
  String? category;
  String? clothType;
  bool? favoriate;

  ProductModel(
      String this.name,
      String this.description,
      double this.price,
      String this.imagePath,
      String this.gender,
      String this.category,
      String this.clothType,
      bool this.favoriate);
}
