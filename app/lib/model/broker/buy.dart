class Buy {
  int? buyId;
  int? quantity;
  String? color;
  int? productId;

  Buy({this.buyId, this.quantity, this.color, this.productId});

  Buy.fromJson(Map<String, dynamic> json) {
    buyId = json['buyId'];
    quantity = json['quantity'];
    color = json['color'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buyId'] = this.buyId;
    data['quantity'] = this.quantity;
    data['color'] = this.color;
    data['productId'] = this.productId;
    return data;
  }
}