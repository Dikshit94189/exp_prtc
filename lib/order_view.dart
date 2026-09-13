import 'package:flutter/material.dart';
import 'package:sampleexpprtc/enums.dart';
import 'package:sampleexpprtc/orderViewModel.dart';

class OrderView extends StatefulWidget {
  const OrderView({super.key});

  @override
  State<OrderView> createState() => _OrderViewState();
}

class _OrderViewState extends State<OrderView> {
final OrderViewModel orderViewModel = OrderViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadOrder();
  }

  Future<void> loadOrder() async {
    setState(() {
      orderViewModel.apiStatus = ApiStatus.loading;});
      await orderViewModel.fetchOrderRes();
      setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    switch(orderViewModel.apiStatus){
      case ApiStatus.initial:
        return SizedBox();
      case ApiStatus.loading:
        return CircularProgressIndicator();
      case ApiStatus.success:
        return ListView.builder(
          itemCount:  orderViewModel.order.length,
            itemBuilder: (context , index){
              final orderS = orderViewModel.order[index];

                  return ListTile(
                    title: Text(orderS.product),
                    subtitle: Text('₹${orderS.price}'),
                    trailing: Text('#${orderS.id}'),
                  );

        });
      case ApiStatus.error:
        return Center(
          child: Text(orderViewModel.errorMessage ?? 'Something went wrong',),
        );
    }
  }
}
