import 'dart:io';

import 'package:SAAYADecor/app/constants.dart';
import 'package:SAAYADecor/data_source/remote_data_source/response/orderResponse.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helper/httpservices.dart';


class OrderAPI {
  Future<OrderResponse> getOrderHistory() async {
    OrderResponse? orderResponse;
    try {
      var url = baseUrl + getOrderHistoryUrl;
      var dio = HttpServices().getDioInstance();
      SharedPreferences preferences;
      preferences = await SharedPreferences.getInstance();
      var token = preferences.getString('token');
      var response = await dio.get(url,
          options: Options(
              headers: {HttpHeaders.authorizationHeader: "Bearer $token"}));
      if (response.statusCode == 200) {
        orderResponse = OrderResponse.fromJson(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return orderResponse!;
  }
}
