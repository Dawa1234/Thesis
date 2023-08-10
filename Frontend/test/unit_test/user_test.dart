import 'package:SAAYADecor/data_source/remote_data_source/response/productResponse.dart';
import 'package:SAAYADecor/models/userModel.dart';
import 'package:SAAYADecor/repository/productRepository.dart';
import 'package:SAAYADecor/repository/reviewReposiory.dart';
import 'package:SAAYADecor/repository/userRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  UserRepository? userRepository;
  group("test user register and login", () {
    setUp(() {
      userRepository = UserRepository();
    });
    test("user login test", () async {
      bool expectedResult = true;
      String email = "safal112@gmail.com";
      String password = "123456789";
      User user = User(email: email, password: password);
      bool actual = await UserRepository().loginUser(user);
      expect(actual, expectedResult);
    });

    test("get all product", () async {
      bool expectedResult = true;

      ProductResponse? actial = await ProductRepository().getproducts("havit");
      expect(actial!.success, expectedResult);
    });

    test("user change password", () async {
      bool expectedResult = true;

      String oldPassword = "12345678";

      String newPassword = "123456789";

      String passwordConfirm = "123456789";

      bool actial = await UserRepository()
          .changePassword(oldPassword, newPassword, passwordConfirm);

      expect(actial, expectedResult);
    });

    test("user register test", () async {
      bool expectedResult = true;
      String name = "ram stha";
      String email = "ramstha88@gmail.com";
      String password = "safal12349";
      User user = User(name: name, email: email, password: password);
      bool actual = await UserRepository().registerUser(user);
      expect(actual, expectedResult);
    });

    test("user product test", () async {
      bool expectedResult = true;

      String productId = "63e8fd4ac44a30a63cd0b89b";

      String comment = "manoj@gmail.com";

      int rating = 2;

      bool actial =
          await ReviewRepository().addReview(productId, rating, comment);

      expect(actial, expectedResult);
    });
  });
}

// flutter pub run test_cov_console
// flutter test --coverage ./test/unit_test/user_test.dart

