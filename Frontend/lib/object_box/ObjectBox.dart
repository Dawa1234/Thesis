import 'dart:io';

import 'package:SAAYADecor/object_box/productModal_objectbox.dart';
import 'package:SAAYADecor/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

import '../models/userModel.dart';

//constructor
class ObjectBox {
  late final Store _store; //the store of this app db
  late final Box<ProductModalObjectBox> productBox;
  late final Box<User> _user;

// Delete Store and all boxes
  static Future<void> deleteDatabase() async {
    var dir = await getApplicationDocumentsDirectory();
    Directory('${dir.path}/user').deleteSync(recursive: true);
  }

  ObjectBox(this._store) {
    productBox = Box<ProductModalObjectBox>(_store);
  }

  //Initilization of ObjectBox
  static Future<ObjectBox> init() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(
      getObjectBoxModel(),
      directory: '${dir.path}/product',
    );
    final store2 = Store(getObjectBoxModel(), directory: '${dir.path}/users');

    return ObjectBox(store);
  }

//Product Queries
  List<ProductModalObjectBox> getAllProducts() {
    return productBox.getAll();
  }

  int addProducts(ProductModalObjectBox productBoxs) {
    return productBox.put(productBoxs);
  }

//User Queries

  int addUser(User users) {
    return _user.put(users);
  }

  List<User> getAllUser() {
    return _user.getAll();
  }

// //login User
// User? loginUser (String email, String password){
//   return _user
//   .query(User_.email.equals(email) &
//       User_.password.equals(password))
//       .build()
//       .findFirst();
// }
}
