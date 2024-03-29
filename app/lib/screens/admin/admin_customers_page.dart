import 'package:app/Widget/common/custome_divider.dart';
import 'package:app/bloc/customer/customer_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/screens/admin/admin_customer_profile.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';

class AdminCustomersPage extends StatefulWidget {
  static const routeName = "/AdmminCustomerPage";
  AdminCustomersPage({Key? key}) : super(key: key);

  @override
  State<AdminCustomersPage> createState() => _AdminCustomersPageState();
}

class _AdminCustomersPageState extends State<AdminCustomersPage> {
  List<int> _users = [1, 2, 3, 4, 5, 6, 7];
  @override
  void initState() {
    BlocProvider.of<CustomerBloc>(context).add(FetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerBloc, CustomerState>(
      builder: (context, state) {
        if (state is CustomersLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CustomersLoadFailed) {
          return Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error,
                color: primaryColor,
              ),
              Text(
                LocaleKeys.something_went_wrong_label_text.tr(),
                style: TextStyle(fontSize: 20.0, color: primaryColor),
              )
            ],
          ));
        }
        return SingleChildScrollView(
          child: Container(
            color: lightColor,
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: state.customers.isEmpty
                ? Center(
                    child: Text(
                      LocaleKeys.no_customers_label_text.tr(),
                    ),
                  )
                : Column(
                    children: state.customers
                        .map((customer) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => AdminCustomerProfile(
                                      customer: customer,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Container(
                                        width: 50.0,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              "${Ip.ip}/api/users/get/?fileName=${customer.user!.picture as String}",
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            width: 120,
                                            height: 120.0,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                              child: SpinKitCircle(
                                            color: primaryColor,
                                          )),
                                          errorWidget: (context, url, _) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                      title: Text(customer.user!.fullName!),
                                      subtitle: Text("Addis Ababa, Arada"),
                                      trailing: Text("12-12-2021"),
                                    ),
                                    CustomDivider()
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                  ),
          ),
        );
      },
    );
  }
}
