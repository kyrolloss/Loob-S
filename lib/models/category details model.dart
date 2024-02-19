
import 'home_model.dart';

class CategoryDetailsModel {
  bool? status;
  dynamic message;
  Data? data;


  CategoryDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

}

class Data {

  List <Products>? products;
  
  Data.fromJson(Map<String,dynamic>json){
  if (json['data']!= null){
    products =<Products>[];
    json['data'].forEach((v){
      products!.add(new Products.fromJson(v));
    });
    }
  }
  
  


}
// class Products {
//   int? id;
//   dynamic price;
//   List<Data>? data;
//   dynamic oldPrice;
//   int? discount;
//   String? image;
//   String? name;
//   String? description;
//   List<String>? images;
//   bool? inFavorites;
//   bool? inCart;
//
//   Products(
//       {this.id,
//         this.data,
//         this.price,
//         this.oldPrice,
//         this.discount,
//         this.image,
//         this.name,
//         this.description,
//         this.images,
//         this.inFavorites,
//         this.inCart});
//
//
//   Products.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     price = json['price'];
//     oldPrice = json['old_price'];
//     discount = json['discount'];
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//     images = json['images'].cast<String>();
//     inFavorites = json['in_favorites'];
//     inCart = json['in_cart'];
//   }
//
//
//
//
// }

