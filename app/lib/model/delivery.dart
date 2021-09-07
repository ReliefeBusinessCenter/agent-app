class Delivery {
  int? deliveryId;
  String? deliveryStatus;
  String? location;

  Delivery({this.deliveryId, this.deliveryStatus, this.location});

  Delivery.fromJson(Map<String, dynamic> json) {
    deliveryId = json['deliveryId'];
    deliveryStatus = json['deliveryStatus'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deliveryId'] = this.deliveryId;
    data['deliveryStatus'] = this.deliveryStatus;
    data['location'] = this.location;
    return data;
  }
}