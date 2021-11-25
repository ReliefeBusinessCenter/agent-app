class City {
  int? cityId;
  String? cityName;

  City({ this.cityId,  this.cityName});

  factory City.fromJson(Map<String, dynamic> json) {
   int cityId = json['cityId'] ?? 0;
    String cityName = json['cityName'] ?? "Addis Ababa";

   return City(cityId: cityId, cityName: cityName,);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cityId'] = this.cityId;
    data['cityName'] = this.cityName;
    return data;
  }
}
