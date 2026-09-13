import 'package:sampleexpprtc/enums.dart';
import 'package:sampleexpprtc/order_response.dart';

class OrderViewModel {
  ApiStatus apiStatus = ApiStatus.initial;

  List<OrderResponse> order = [];
  String? errorMessage;

  Future<void> fetchOrderRes() async {
    apiStatus = ApiStatus.loading;
    try {
      final json = {
        "orders": [
          {"id": 1, "product": "iPhone", "price": 50000},
          {"id": 2, "product": "Laptop", "price": 70000},
        ],
      };

      final response = OrderResponse.fromJson(json);
      order =  response.orderRes;

      apiStatus = ApiStatus.success;
    } catch (e) {
      apiStatus = ApiStatus.error;
      errorMessage = e.toString();
    }
  }
}
