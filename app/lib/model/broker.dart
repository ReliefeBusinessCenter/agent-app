import 'package:app/model/category.dart';

import 'category.dart';

class Broker {
  final int id;
  final String name;
  final int categoryId;
  final String image;
  final double rating;
  final double view;
  final String about;
  final double completedWorks;
  final double workInProgress;
  final double communicationSkill;
  final double brokingSkill;
  bool isFavorite;

  Broker(
      {required this.id,
      required this.name,
      required this.categoryId,
      required this.image,
      required this.rating,
      required this.view,
      required this.about,
      required this.completedWorks,
      required this.workInProgress,
      required this.communicationSkill,
      required this.brokingSkill,
      required this.isFavorite});
}
