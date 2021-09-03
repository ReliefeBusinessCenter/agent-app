class Category {
  int? catigoryId;
  String? catigoryName;

  Category({this.catigoryId, this.catigoryName});

  Category.fromJson(Map<String, dynamic> json) {
    catigoryId = json['catigoryId'];
    catigoryName = json['catigoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catigoryId'] = this.catigoryId;
    data['catigoryName'] = this.catigoryName;
    return data;
  }
}