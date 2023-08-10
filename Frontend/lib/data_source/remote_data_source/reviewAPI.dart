import 'dart:io';

import 'package:SAAYADecor/data_source/remote_data_source/response/reviewResponse.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../app/constants.dart';
import '../../helper/httpservices.dart';

class ReviewApi {
  Future<bool> addReview(String id, int rating, String comment) async {
    ReviewResponse? reviewResponse;
    bool isReview = false;
    try {
      var reviewurl = baseUrl + potReviewUrl;
      var dio = HttpServices().getDioInstance();
      Response response;
      print(id);
      SharedPreferences preferences;
      preferences = await SharedPreferences.getInstance();
      String? token = preferences.getString('token');
      print(token);
      response = await dio.post(reviewurl,
          data: {"productId": id, "rating": rating, "comment": comment},
          options: Options(
              headers: {HttpHeaders.authorizationHeader: "Bearer $token"}));
      if (response.statusCode == 200) {
        isReview = true;
      } else {
        reviewResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return isReview;
  }

  Future<ReviewResponse> getReviews(String? id) async {
    ReviewResponse? reviewResponse;
    try {
      var getreviewurl = baseUrl + getReviewUrl;
      var dio = HttpServices().getDioInstance();
      Response response =
          await dio.get(getreviewurl, queryParameters: {"id": id});
      // print(response);
      if (response.statusCode == 200) {
        reviewResponse = ReviewResponse.fromJson(response.data);
        var a = 0;
      } else {
        reviewResponse = null;
      }
    } catch (e) {
      throw Exception(e);
    }
    return reviewResponse!;
  }
}
