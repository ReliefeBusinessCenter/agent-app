import 'buy.dart';

class User {
  int? userId;
  String? fullName;
  String? email;
  String? password;
  String? phone;
  // String? address;
  String? picture;
  String? identificationCard;
  String? sex;
  String? role;
  String? city;
  String? subCity;
  String? kebele;
  List<dynamic>? buys;

  User(
      {this.userId,
      this.fullName,
      this.email,
      this.password,
      this.phone,
      this.identificationCard,
      // this.address,
      this.picture,
      this.sex,
      this.role,
      this.city,
      this.subCity,
      this.kebele,
      this.buys});

// "userId": 1,
//             "fullName": "Customer Fasikaw",
//             "email": "yared@gmail.com",
//             "password": "yare123",
//             "phone": "091689234",
//             "city": "Dessie",
//             "subcity": "Dessie",
//             "kebele": 10,
//             "picture": "yared.jpg",
//             "identificationCard": null,
//             "sex": "Male",
//             "role": "Custoemr",
//             "buys": null
  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    // address = json['address'];
    city = json['city'];
    subCity = json['subcity'];
    kebele = json['kebele'];

    picture = json['picture'];

    sex = json['sex'];
    role = json['role'];
    buys = json['buys'];
    identificationCard = json['identificationCard'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    // data['address'] = this.address;
    data['city'] = this.city;
    data['subcity'] = this.subCity;
    data['kebele'] = this.kebele;

    data['picture'] = this.picture;
    data['sex'] = this.sex;
    data['role'] = this.role;
    data['buys'] = this.buys;
    data['identificationCard'] = this.identificationCard;
    return data;
  }
}
