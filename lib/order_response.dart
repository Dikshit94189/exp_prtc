class OrderResponse {
  final List<OrderResponse> orderRes;

  OrderResponse({required this.orderRes});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      orderRes: (json["orders"] as List)
          .map((order) => OrderResponse.fromJson(order))
          .toList(),
    );
  }
}
