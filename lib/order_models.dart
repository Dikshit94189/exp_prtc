// {
// "orders": [
// {
// "id": 1,
// "product": "iPhone",
// "price": 50000
// },
// {
// "id": 2,
// "product": "Laptop",
// "price": 70000
// }
// ]
// }


class OrderModel {
  final int id;
  final String product;
  final double price;

  OrderModel({required this.id, required this.product, required this.price});

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json["id"],
      product: json["product"],
      price: (json["price"] as num).toDouble(),
    );
  }
}
