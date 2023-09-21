
class Product{
  String? title,image;
  double? normalPrice,newPrice;
  bool favorite ;
  Product({required this.title, required this.normalPrice, required this.newPrice, this.favorite = false, this.image="assets/3.jpg"});
}