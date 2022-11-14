// class User {
//   int? userId;
//   String? fullName;
//   String? email;
//   String? password;
//   String? phone;
//   String? address;
//   String? picture;
//   String? sex;
//   String? role;
//   String? city;
//   String? subCity;
//   String? kebele;
//   Null? buys;
//   String? identificationCard;
//   double? latitude;
//   double? longitude;

//   User(
//       {this.userId,
//       this.fullName,
//       this.email,
//       this.password,
//       this.phone,
//       this.address,
//       this.picture,
//       this.sex,
//       this.role,
//       this.city,
//       this.subCity,
//       this.kebele,
//       this.identificationCard,
//       this.buys,
//       this.latitude,
//       this.longitude
//       });

//  factory User.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     fullName = json['fullName'];
//     email = json['email'];
//     password = json['password'];
//     phone = json['phone'];
//     address = json['address'];
//     picture = json['picture'];
//     sex = json['sex'];
//     role = json['role'];
//     buys = json['buys'];
//     latitude = json
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['userId'] = this.userId;
//     data['fullName'] = this.fullName;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     data['phone'] = this.phone;
//     data['address'] = this.address;
//     data['picture'] = this.picture;
//     data['sex'] = this.sex;
//     data['role'] = this.role;
//     data['buys'] = this.buys;
//     return data;
//   }
// }



class RegisterCheckUp {
  String? phoneNumber;
  RegisterCheckUp({ this.phoneNumber});


   RegisterCheckUp.fromJson(Map<String, dynamic> json){
     phoneNumber = json['phoneNumber'];
     
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}