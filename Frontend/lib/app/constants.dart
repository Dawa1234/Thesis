//const baseUrl = "http://192.168.0.6:4000/api/v2/";//for real device
//const baseUrl = "http://172.20.10.5:4000/api/v2/";//for emu
const baseUrl = "http://10.0.2.2:4000/api/v2/"; //for emu
//const baseUrl = "http://localhost:4000/api/v2/";//for testing
//"http://172.26.1.89:4000/api/v2/";//
//"http://192.168.1.70:4000/api/v2/";
const loginUrl = "login";
const registerUrl = "register";
const getProductsUrl = "products";
const getProfileUrl = "userdetails";
const getOrderHistoryUrl = "orders/myyy";
const changePasswordUrl = "me/updates";
const getReviewUrl = "product/review";
const potReviewUrl = "product/reviews";
const updateProfileUrl = "me/update/profiles";

String? token;

// flutter test --coverage ./test/unit_test/user_test.dart
// flutter pub run test_cov_console                       
// adb -d forward tcp:5601 tcp:5601     