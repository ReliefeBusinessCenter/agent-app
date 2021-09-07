class Reviews {
  int? reviewId;
  int? rate;

  Reviews({this.reviewId, this.rate});

  Reviews.fromJson(Map<String, dynamic> json) {
    reviewId = json['reviewId'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewId'] = this.reviewId;
    data['rate'] = this.rate;
    return data;
  }
}