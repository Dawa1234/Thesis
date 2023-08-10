import 'package:SAAYADecor/data_source/remote_data_source/response/productResponse.dart';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';

import '../../app/constants.dart';

class ProductAPI {
  Future<ProductResponse?> getproduct(String? search) async {
    Future.delayed(const Duration(seconds: 2), () {});
    ProductResponse? productResponse;
    Response response;
    // Box box;
    // var dir = await getApplicationDocumentsDirectory();
    // Hive.init(dir.path);

    // box = await Hive.openBox('test');

    try {
      var dio = Dio();
      dio.interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: "http://www.google.com"))
              .interceptor);
      var url = baseUrl + getProductsUrl;
      response = await dio.get(
        url,
        // queryParameters: {'keyword': search},
        // options: buildCacheOptions(Duration(days: 7)
        // ),
      );

      if (response.statusCode == 200) {
        productResponse = ProductResponse.fromJson(response.data);
      }
    } catch (e) {
      print(e.toString());
    }
    return productResponse;
  }
}
