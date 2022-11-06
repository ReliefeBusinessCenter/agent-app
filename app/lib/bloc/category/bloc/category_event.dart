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

class AddCategory extends CategoryEvent {
  final Category category;
  const AddCategory(this.category);
}

class UpdateCategory extends CategoryEvent {
  final Category category;
  const UpdateCategory(this.category);
}
