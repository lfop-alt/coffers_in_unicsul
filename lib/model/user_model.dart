class UserModel {
  String? objectId;
  String? username;
  String? createdAt;
  String? updatedAt;
  List<Cart>? cart;

  UserModel(
      {this.objectId,
      this.username,
      this.createdAt,
      this.updatedAt,
      this.cart});

  UserModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    username = json['username'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['cart'] != null) {
      cart = <Cart>[];
      json['cart'].forEach((v) {
        cart!.add(Cart.fromJson(v));
      });
    } else {
      cart = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['username'] = username;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (cart != null) {
      data['cart'] = cart!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cart {
  String? objectId;
  String? nameCoffee;

  String? descriptionCoffee;
  String? priceCoffee;

  Cart(
      {this.objectId,
      this.descriptionCoffee,
      this.nameCoffee,
      this.priceCoffee});

  Cart.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    nameCoffee = json['nameCoffee'];
    descriptionCoffee = json['descriptionCoffee'];
    priceCoffee = json['priceCoffee'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['nameCoffee'] = nameCoffee;

    data['descriptionCoffee'] = descriptionCoffee;
    data['priceCoffee'] = priceCoffee;
    return data;
  }
}
