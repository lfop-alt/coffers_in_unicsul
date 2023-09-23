class ItemModel {
  List<Results>? results;

  ItemModel({this.results});

  ItemModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? objectId;
  ImageCoffee imageCoffee = ImageCoffee();
  String? nameCoffee;
  String? createdAt;
  String? updatedAt;
  String? priceCoffee;
  String? descriptionCoffee;
  List<int>? ingredientCoffee;

  Results(this.imageCoffee,
      {this.objectId,
      this.nameCoffee,
      this.createdAt,
      this.updatedAt,
      this.priceCoffee,
      this.descriptionCoffee,
      this.ingredientCoffee});

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    imageCoffee = ImageCoffee.fromJson(json['imageCoffee']);

    nameCoffee = json['nameCoffee'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    priceCoffee = json['priceCoffee'];
    descriptionCoffee = json['descriptionCoffee'];
    ingredientCoffee = json['ingredientCoffee'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['imageCoffee'] = imageCoffee.toJson();
    data['nameCoffee'] = nameCoffee;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['priceCoffee'] = priceCoffee;
    data['descriptionCoffee'] = descriptionCoffee;
    data['ingredientCoffee'] = ingredientCoffee;
    return data;
  }
}

class ImageCoffee {
  String? sType;
  String? name;
  String? url;

  ImageCoffee({this.sType, this.name, this.url});

  ImageCoffee.fromJson(Map<String, dynamic> json) {
    sType = json['__type'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['__type'] = sType;
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
