import 'package:app/Widget/Dashboard/broker.dart';
import 'package:app/Widget/Dashboard/customSearchBar.dart';
import 'package:app/Widget/broker-widget/customer_search_bar.dart';
import 'package:app/Widget/customer/customer-item.dart';
import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/bloc/customer/customer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class BrokerCustomerList extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  BrokerCustomerList({required this.scaffoldKey});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFFf2f6f9),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CustomerSearchTextField(),
            ),
            Expanded(
              child: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  if (state is CustomersLoadSuccess) {
                    print(
                        "Successfully loadded to the screen: ${state.customers}");
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
                            itemCount: state.customers.length,
                            itemBuilder: (BuildContext ctx, index) {
                              return Container(
                                  child: CustomerItem(
                                customer: state.customers[index],
                              ));
                            }));
                  } else if (state is CustomersLoading) {
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
      ),
    );
  }
}
