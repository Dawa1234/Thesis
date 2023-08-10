
import '../data_source/remote_data_source/profileAPI.dart';
import '../data_source/remote_data_source/response/profileResponse.dart';

class ProfileRepository {
  Future<ProfileResponse?> getprofile() async {
    return ProfileAPI().getprofile();
  }
}

