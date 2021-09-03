
class User {
  int? userId;
  String? fullName;
  String? email;
  String? password;
  String? phone;
  String? address;
  String? picture;
  String? sex;
  String? role;
  Null? buys;

  User(
      {this.userId,
      this.fullName,
      this.email,
      this.password,
      this.phone,
      this.address,
      this.picture,
      this.sex,
      this.role,
      this.buys});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    fullName = json['fullName'];
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
    address = json['address'];
    picture = json['picture'];
    sex = json['sex'];
    role = json['role'];
    buys = json['buys'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['picture'] = this.picture;
    data['sex'] = this.sex;
    data['role'] = this.role;
    data['buys'] = this.buys;
    return data;
  }
}