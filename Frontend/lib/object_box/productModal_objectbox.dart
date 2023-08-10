import 'package:objectbox/objectbox.dart';


@Entity()
class ProductModalObjectBox{
  @Id()
  late int id;
  String? name;
  String? description;
  int? price;
  double? ratings;
  String? category;
  int? stock;
  int? NoOfReviews;
  String? createdAt;
  String? time;

  ProductModalObjectBox({
    this.name,
    this.price,
    this.ratings,
    this.category,
    this.stock,
    this.NoOfReviews,
    this.createdAt,
    this.time,
  });

}