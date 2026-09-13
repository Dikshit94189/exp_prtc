class OrderModel {
  final int id;
  final String product;
  final dynamic price;

  OrderModel({required this.id, required this.product, required this.price});

  factory OrderModel.fromJson(Map<String, dynamic> json){
    return OrderModel(
      id: json["id"],
      product: json["product"],
      price: (json["price"] as num).toDouble(),
    );
  }

}