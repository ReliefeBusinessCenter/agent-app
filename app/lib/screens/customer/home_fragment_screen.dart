import 'package:app/Widget/Dashboard/broker.dart';
import 'package:app/Widget/Dashboard/customCategory.dart';
import 'package:app/Widget/Dashboard/customSearchBar.dart';
import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/bloc/category/bloc/category_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomeFragment extends StatelessWidget {
  late BrokerBloc brokerBloc;
  late CategoryBloc categoryBloc;

  @override
  Widget build(BuildContext context) {
    // Category category= new Category();
    brokerBloc = BlocProvider.of<BrokerBloc>(context);
    categoryBloc = BlocProvider.of<CategoryBloc>(context);
    brokerBloc.add(FetchEvent());

    return Container(
      color: Color(0xFFf2f6f9),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchTextField(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: BlocBuilder<CategoryBloc, CategoryState>(
                  // buildWhen: (previous, current) =>
                  //     previous.selectedCategoryId != current.selectedCategoryId,
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return CircularProgressIndicator();
                    }

                    List<Widget> categories = [];
                    if (state is CategoryLoadSuccess) {
                      print(
                          "the home screen is rebuilding because of the bloc call and this is the category id ${state.selectedCategoryId}");
                      categories.add(CustomCategory(
                        backgroundColor: state.selectedCategoryId == null
                            ? Theme.of(context).primaryColor
                            : Color(0xFF015777).withOpacity(0.05),
                        fontColor: state.selectedCategoryId == null
                            ? Colors.white
                            : Colors.black.withOpacity(0.8),
                        text: "All",
                        onPressed: () {
                          // print(
                          // "This is the name of the category:${DUMMY_CATEGORIES[i].name}");
                          brokerBloc
                              .add(SelectEvent(categoryId: 0, search: ''));

                          categoryBloc.add(SelectCategory(categoryId: null));
                        },
                      ));
                      for (int i = 0; i < state.category.length; i++) {
                        // Category category = state.category[i] as Category;
                        // print(category);
                        categories.add(
                          CustomCategory(
                            backgroundColor: state.selectedCategoryId ==
                                    state.category[i].categoryId
                                ? Theme.of(context).primaryColor
                                : Color(0xFF015777).withOpacity(0.05),
                            fontColor: state.selectedCategoryId ==
                                    state.category[i].categoryId
                                ? Colors.white
                                : Colors.black.withOpacity(0.8),
                            text: state.category[i].catigoryName!,
                            onPressed: () {
                              brokerBloc.add(
                                SelectEvent(
                                  categoryId: state.category[i].categoryId!,
                                  search: '',
                                ),
                              );
                              categoryBloc.add(SelectCategory(
                                  categoryId: state.category[i].categoryId!));
                            },
                          ),
                        );
                      }
                      return Row(children: categories);
                    }

                    return Container();
                  },
                )),
          ),
          Expanded(
            child: BlocBuilder<BrokerBloc, BrokerState>(
              builder: (context, state) {
                if (state is BrokersLoadSuccess) {
                  return LazyLoadScrollView(
                    onEndOfPage: () {},
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent:
                            MediaQuery.of(context).size.width * 0.6,
                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.35,
                      ),
                      itemCount: state.brokers.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return Container(
                          child: BrokerItem(
                            broker: state.brokers[index],
                          ),
                        );
                      },
                    ),
                  );
                } else if (state is BrokersLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
