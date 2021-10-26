import 'package:app/data_provider/categories_data_provider.dart';
import 'package:app/model/broker/category.dart';



class CategoryRepository {
  late final CategoriesDataProvider categoryDataProvider;
  CategoryRepository({
    required this.categoryDataProvider,
  });

  Future<List<Category>> getCategories() async {
    List<Category> data = await categoryDataProvider.getCategories();
    print("Data arrived at the data provider $data");
    return data;
  }
}
