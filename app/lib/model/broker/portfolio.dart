class Portfolios {
  int? portfolioId;
  String? image;
  String? name;
  String? description;

  Portfolios({this.portfolioId, this.image, this.name, this.description});

  Portfolios.fromJson(Map<String, dynamic> json) {
    portfolioId = json['portfolioId'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['portfolioId'] = this.portfolioId;
    data['image'] = this.image;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}