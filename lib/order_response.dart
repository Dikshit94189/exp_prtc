import 'dart:convert';

import 'package:sampleexpprtc/order_models.dart';

class OrderResponse {
  final List<OrderModel> orderRes;

  OrderResponse({required this.orderRes});

   factory OrderResponse.fromJson(Map<String , dynamic> json){
     return OrderResponse(
       orderRes: (json['orders'] as List).
         map((order) => OrderModel.fromJson(order))
           .toList(),
     );
   }
}
