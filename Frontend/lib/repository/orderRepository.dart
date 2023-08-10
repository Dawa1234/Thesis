

import '../data_source/remote_data_source/orderAPI.dart';
import '../data_source/remote_data_source/response/orderResponse.dart';

class OrderRepository{
  Future<OrderResponse> getOrderHistory() async{
    return OrderAPI().getOrderHistory();
  }
}
