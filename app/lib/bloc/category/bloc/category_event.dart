part of 'category_bloc.dart';



// 

abstract class CategoryEvent {
  const CategoryEvent();
}

class FetchCategories extends CategoryEvent {}

class SelectCategory extends CategoryEvent {
  final int? categoryId;
  SelectCategory({required this.categoryId});
}
