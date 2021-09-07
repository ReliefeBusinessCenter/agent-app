class Deals {
  int? dealsId;
  int? quantity;
  String? location;
  String? color;
  String? paymentOption;
  String? dealsStatus;

  Deals(
      {this.dealsId,
      this.quantity,
      this.location,
      this.color,
      this.paymentOption,
      this.dealsStatus});

  Deals.fromJson(Map<String, dynamic> json) {
    dealsId = json['dealsId'];
    quantity = json['quantity'];
    location = json['location'];
    color = json['color'];
    paymentOption = json['paymentOption'];
    dealsStatus = json['dealsStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dealsId'] = this.dealsId;
    data['quantity'] = this.quantity;
    data['location'] = this.location;
    data['color'] = this.color;
    data['paymentOption'] = this.paymentOption;
    data['dealsStatus'] = this.dealsStatus;
    return data;
  }
}