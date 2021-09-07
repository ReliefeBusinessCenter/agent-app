import 'package:app/model/review.dart';
import 'package:app/model/broker/skills.dart';

import 'category.dart';
import '../deals.dart';
import '../delivery.dart';
import 'portfolio.dart';
import 'user.dart';

class Broker {
  int? brokerId;
  List<Portfolios>? portfolios;
  List<Delivery>? deliveries;
  List<Deals>? deals;
  List<Reviews>? reviews;
  Skills? skills;
  Category? category;
  User? user;
  bool? isFavorite;

  Broker(
      {this.brokerId,
      this.portfolios,
      this.deliveries,
      this.deals,
      this.reviews,
      this.skills,
      this.category,
      this.isFavorite,
      this.user});

  Broker.fromJson(Map<String, dynamic> json) {
    brokerId = json['brokerId'];
    if (json['portfolios'] != null) {
      portfolios = <Portfolios>[];
      json['portfolios'].forEach((v) {
        portfolios!.add(new Portfolios.fromJson(v));
      });
    }
    if (json['deliveries'] != null) {
      deliveries = <Delivery>[];
      json['deliveries'].forEach((v) {
        deliveries!.add(new Delivery.fromJson(v));
      });
    }
    if (json['deals'] != null) {
      deals = <Deals>[];
      json['deals'].forEach((v) {
        deals!.add(new Deals.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    skills =
        json['skills'] != null ? new Skills.fromJson(json['skills']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brokerId'] = this.brokerId;
    if (this.portfolios != null) {
      data['portfolios'] = this.portfolios!.map((v) => v.toJson()).toList();
    }
    if (this.deliveries != null) {
      data['deliveries'] = this.deliveries!.map((v) => v.toJson()).toList();
    }
    if (this.deals != null) {
      data['deals'] = this.deals!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.skills != null) {
      data['skills'] = this.skills!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}
