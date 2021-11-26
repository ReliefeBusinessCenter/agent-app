class SaveLoan {
  String? fullName;
  String? phone;
  String? picture;
  String? identificationCard;

  SaveLoan({
     this.fullName,
     this.phone,
     this.picture,
     this.identificationCard,
  });

  factory SaveLoan.fromJson(Map<String, dynamic> json) {
    String fullName = json['fullName'];
    String phone = json['phone'];
    String picture = json['picture'];
    String identificationCard = json['identificationCard'];

    return SaveLoan(
      fullName: fullName,
      phone: phone,
      picture: picture,
      identificationCard: identificationCard,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['phone'] = this.phone;
    data['picture'] = this.picture;
    data['identificationCard'] = this.identificationCard;
    return data;
  }
}
