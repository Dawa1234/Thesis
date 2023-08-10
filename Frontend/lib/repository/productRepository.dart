

import '../data_source/remote_data_source/productAPI.dart';
import '../data_source/remote_data_source/response/productResponse.dart';

class ProductRepository {
  Future<ProductResponse?> getproducts(String? search) async {
    return ProductAPI().getproduct(search);
  }
}
