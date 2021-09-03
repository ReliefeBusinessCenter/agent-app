class Category {
  int? categoryId;
  String? catigoryName;

  Category({this.categoryId, this.catigoryName});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    catigoryName = json['catigoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['catigoryName'] = this.catigoryName;
    return data;
  }
}