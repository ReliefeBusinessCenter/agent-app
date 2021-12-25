import 'dart:async';

import 'package:app/model/broker/category.dart';
import 'package:app/repository/category_repository.dart';
import 'package:bloc/bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

// class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
//   CategoryBloc() : super(CategoryInitial());

//   @override
//   Stream<CategoryState> mapEventToState(
//     CategoryEvent event,
//   ) async* {
//     // TODO: implement mapEventToState
//   }
// }

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository categoryRepository;
  CategoryBloc({required this.categoryRepository}) : super(CategoryInitial());

  @override
  Stream<CategoryState> mapEventToState(
    CategoryEvent event,
  ) async* {
    if (event is FetchCategories) {
      yield CategoryLoading();
      try {
        List<Category> categories =
            await this.categoryRepository.getCategories();
        if (categories == []) {
          yield CategoryLoadFailed(message: "Failed to Fetch");
        } else {
          yield CategoryLoadSuccess(
              category: categories, selectedCategoryId: null);
        }
      } catch (e) {
        print(e.toString());
      }
    } else if (event is AddCategory) {
      yield CategoryLoading();
      try {
        Category _category =
            await categoryRepository.addCategory(event.category);
             List<Category> categories =
            await this.categoryRepository.getCategories();
            
        if (_category is Category) {
          yield CategoryLoadSuccess(category: categories, selectedCategoryId: null);
        } else {
          yield CategoryLoadFailed(message: "Failed to fetch");
        }
      } catch (e) {
        yield CategoryLoadFailed(message: "Failed to fetch");
      }
    } else if (event is UpdateCategory) {
      yield CategoryLoading();
      try {
        Category _category =
            await categoryRepository.updateCategory(event.category);
             List<Category> categories =
            await this.categoryRepository.getCategories();
        if (_category is Category) {
          yield CategoryLoadSuccess(category: categories, selectedCategoryId: null);
        } else {
          yield CategoryLoadFailed(message: "Failed to fetch");
        }
      } catch (e) {
          print("The errrorrrrrrrrrrrrrrrcreate is ${e.toString()}");
        yield CategoryLoadFailed(message: "Failed to fetch");
      }
    } else if (event is SelectCategory) {
      print("---select category event");
      yield CategoryLoadSuccess(
          category: state.category, selectedCategoryId: event.categoryId);
    }
  }
}
