import 'package:app/Widget/Dashboard/broker.dart';
import 'package:app/Widget/Dashboard/customCategory.dart';
import 'package:app/Widget/Dashboard/customSearchBar.dart';
import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/constants/customer-page/categories.dart';
import 'package:app/model/broker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class HomeFragment extends StatelessWidget {
  late BrokerBloc brokerBloc;

  @override
  Widget build(BuildContext context) {
    // Category category= new Category();
    brokerBloc = BlocProvider.of<BrokerBloc>(context);
    // brokerBloc.add(SelectEvent(categoryId: 0));

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
                child: BlocBuilder<BrokerBloc, BrokerState>(
                  // buildWhen: (previous, current) =>
                  //     previous.selectedCategoryId != current.selectedCategoryId,
                  builder: (context, state) {
                    if (state is BrokersLoading) {
                      return CircularProgressIndicator();
                    }

                    List<Widget> categories = [];
                    print(
                        "the home screen is rebuilding because of the bloc call and this is the category id ${state.selectedCategoryId}");
                    // for (int i = 0; i < DUMMY_CATEGORIES.length; i++) {
                    //   print(DUMMY_CATEGORIES[i].name);
                    //   categories.add(CustomCategory(
                    //     backgroundColor:
                    //         state.selectedCategoryId == DUMMY_CATEGORIES[i].id
                    //             ? Theme.of(context).primaryColor
                    //             : Color(0xFF015777).withOpacity(0.05),
                    //     fontColor:
                    //         state.selectedCategoryId == DUMMY_CATEGORIES[i].id
                    //             ? Colors.white
                    //             : Colors.black.withOpacity(0.8),
                    //     text: DUMMY_CATEGORIES[i].name,
                    //     onPressed: () {
                    //       print(
                    //           "This is teh name of the category:${DUMMY_CATEGORIES[i].name}");
                    //       brokerBloc.add(SelectEvent(
                    //           categoryId: DUMMY_CATEGORIES[i].id, search: ''));
                    //     },
                    //   ));
                    // }

                    return Row(children: categories);
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
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
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
                            ));
                          }));
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
