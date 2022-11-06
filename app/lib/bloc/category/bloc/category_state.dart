part of 'category_bloc.dart';

// 


abstract class CategoryState {
  final List<Category> category;
  final int? selectedCategoryId;
  CategoryState({required this.category, required this.selectedCategoryId});
}

class CategoryInitial extends CategoryState {
  CategoryInitial() : super(category: [], selectedCategoryId: null);
}

class CategoryLoading extends CategoryState {
  CategoryLoading() : super(category: [], selectedCategoryId: null);
}

class CategoryLoadSuccess extends CategoryState {
  final List<Category> category;
  final int? selectedCategoryId;
  CategoryLoadSuccess(
      {required this.category, required this.selectedCategoryId})
      : super(category: category, selectedCategoryId: null);
}

class CategoryLoadFailed extends CategoryState {
  final String message;
  CategoryLoadFailed({required this.message})
      : super(category: [], selectedCategoryId: null);
}
