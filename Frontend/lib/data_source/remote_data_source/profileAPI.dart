
import 'package:SAAYADecor/app/constants.dart';
import 'package:SAAYADecor/data_source/remote_data_source/response/profileResponse.dart';
import 'package:SAAYADecor/helper/httpservices.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';



class ProfileAPI {
  Future<ProfileResponse?> getprofile() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String? token = sharedPreferences.getString('token');

    Future.delayed(const Duration(seconds: 2), () {});
    ProfileResponse? profileResponse;
    try {
      var dio = HttpServices().getDioInstance();
      var url = baseUrl + getProfileUrl;
      Response response = await dio.get(url,
          options: Options(
            headers: {
              'Authorization': 'Bearer ' + token!,
            },
          ));

      if (response.statusCode == 200) {
        print(response.data['user']);

        profileResponse = ProfileResponse.fromJson(response.data);
        print("hchcbhchdbchdbchdbchdbchdbchdcbhdcbdhcbhdcbdhcbdhcbhdcbdhc");
      }
    } catch (e) {
      throw Exception(e);
    }
    return profileResponse;
  }
}
