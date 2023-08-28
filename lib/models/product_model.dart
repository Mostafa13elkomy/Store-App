class productModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final RatingModel? rating;
  final String category;
  productModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.price,
      required this.description,
      required this.image,
      required this.rating});

  factory productModel.fromJson(jsonData) {
    return productModel(
        id :jsonData['id'],
        title: jsonData['title'],
        category: jsonData['category'],
        price: jsonData['price'],
        description: jsonData['description'],
        image: jsonData['image'],
        rating: jsonData['rating'] == null
            ? null
            : RatingModel.fromJson(jsonData['rating']));
  }
}

class RatingModel {
  final dynamic rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(jsonData) {
    return RatingModel(rate: jsonData['rate'], count: jsonData['count']);
  }
}