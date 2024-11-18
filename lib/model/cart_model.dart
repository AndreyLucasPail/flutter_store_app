class CartModel {
  CartModel({
    this.title,
    this.totalPrice,
    this.img,
    this.size,
    this.quantity,
    this.id,
  });

  double? totalPrice;
  String? title;
  String? img;
  String? size;
  int? quantity;
  int? id;
}
