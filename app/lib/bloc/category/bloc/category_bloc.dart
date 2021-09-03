import 'dart:async';

import 'package:app/model/category.dart';
import 'package:app/model/category.dart';
import 'package:app/repository/category_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
      print("categoris fetch is being called!");
      yield CategoryLoading();
      try {
        List<Category> categories =
            await this.categoryRepository.getCategories();
        if (categories == []) {
          print("Failed to fech categories");
          yield CategoryLoadFailed(message: "Failed to Fetch");
        } else {
          print("Data arrived at the bloc: ${categories}");
          yield CategoryLoadSuccess(
              category: categories, selectedCategoryId: null);
        }
      } catch (e) {
        print(e.toString());
      }
    } else if (event is SelectCategory) {
      print("---select category event");
      yield CategoryLoadSuccess(
          category: state.category, selectedCategoryId: event.categoryId);
    }
  }
}
