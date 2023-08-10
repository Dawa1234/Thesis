import 'package:SAAYADecor/repository/orderRepository.dart';

import 'package:flutter/material.dart';
import '../../data_source/remote_data_source/response/orderResponse.dart';
import '../../models/order.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Order History"),
        backgroundColor: const Color.fromARGB(255, 37, 158, 172),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder<OrderResponse>(
              future: OrderRepository().getOrderHistory(),
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<Order> lstOrder = snapshot.data!.orders!;
                    return Column(
                      children: [
                        const SizedBox(height: 20),
                        for (var i = 0; i < lstOrder.length; i++)
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/order_details',
                                  arguments: {
                                    'orderItem': lstOrder[i].orderItems
                                  });
                            },
                            child: Card(                            
                              child: ListTile(
                                leading: Text(
                                  lstOrder[i].id.toString(),
                                ),
                                title: Text(
                                  lstOrder[i].totalPrice.toString(),
                                  style: TextStyle(fontSize: 10),
                                ),
                                subtitle: Text(
                                  lstOrder[i].orderStatus.toString(),
                                  style: TextStyle(fontSize: 10),
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  }
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return const Text("No Order is placed ",style: TextStyle(fontSize: 25),);
              }),
            ),
            Column(
                        children: [
                          Image(
                            image: AssetImage('assets/image/cart.png'),
                          ),
                          SizedBox(height: 20,),
                          Text('Your orders is empty 🛒' ,style: Theme.of(context).textTheme.headline5),
                          SizedBox(height: 20,),
                          Text('Explore products and shop your\nfavourite items 💰 ' , textAlign: TextAlign.center ,style: Theme.of(context).textTheme.subtitle2)

                        ],
                      ),
          ],
        ),
      ),
    );
  }
}
