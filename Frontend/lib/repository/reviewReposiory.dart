
import '../data_source/remote_data_source/response/reviewResponse.dart';
import '../data_source/remote_data_source/reviewAPI.dart';

class ReviewRepository {
  Future<bool> addReview(String id, int rating, String comment) async {
    return ReviewApi().addReview(id, rating, comment);
  }

  Future<ReviewResponse> getReview(String id) async {
    return ReviewApi().getReviews(id);
  }
}
