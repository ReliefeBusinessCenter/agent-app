import 'package:app/Widget/common/user_profile_contact.dart';
import 'package:app/Widget/common/user_profile_edit_page.dart';
import 'package:app/bloc/customer/customer_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';

// ignore: must_be_immutable
class UserProfilePage extends StatefulWidget {
 

  static const routeName = "/userProfile";
  UserProfilePage({
    
    Key? key,
  }) : super(key: key);

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  Customer? _customer;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<CustomerBloc, CustomerState>(
      builder: (context, state) {
        print("Current customer state is $state");
        if (state is CustomersLoading) {
          return Scaffold(
              backgroundColor: lightColor,
              appBar: AppBar(
                backgroundColor: lightColor,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: SafeArea(
                  child: Container(
                      child: Center(child: CircularProgressIndicator()))));
        } else if (state is CustomersLoadFailed) {
          print("The error is ${state.message}");
          return Scaffold(
              appBar: AppBar(
                backgroundColor: lightColor,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: SafeArea(
                  child: Container(
                      child: Center(child: Text(LocaleKeys.something_went_wrong_label_text.tr())))));
        } else if (state is CustomersLoadSuccess) {
          Customer customer = state.customers[0];
          _customer = customer;

          return _customer == null? Center(child: Text("No User"),) : Scaffold(
            appBar: AppBar(
              backgroundColor: lightColor,
              elevation: 0.0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                if (_customer != null)
                  Padding(
                    padding: const EdgeInsets.only(right: 30.0),
                    child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              UserProfileEditPage.routeName,
                              arguments: _customer);
                        },
                        icon: Icon(Icons.edit),
                      ),
                    ),
                  ),
              ],
            ),
            body: SingleChildScrollView(
              child: Container(
                color: lightColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl:
                          "${Ip.ip}/api/users/get/?fileName=${customer.user!.picture as String}",
                      imageBuilder: (context, imageProvider) => Container(
                        width: 120,
                        height: 120.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (context, url) => Center(
                        child: SpinKitCircle(
                          color: primaryColor,
                        ),
                      ),
                      errorWidget: (context, url, _) => Icon(Icons.error),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      customer.user!.fullName.toString(),
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    Container(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                             LocaleKeys.contact_detail_label_text.tr(),
                              style: TextStyle(
                                  color: Colors.grey.shade900, fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Column(
                              children: [
                                Divider(
                                  color: Colors.black,
                                  thickness: 0.4,
                                ),
                                UserPrefileContactDetail(
                                  info: customer.user!.email!,
                                  iconData: Icons.email_outlined,
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 0.4,
                                ),
                                UserPrefileContactDetail(
                                  info: customer.user!.phone!,
                                  iconData: Icons.phone_outlined,
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 0.4,
                                ),
                                UserPrefileContactDetail(
                                    info: ' Addis Ababa',
                                    iconData: Icons.location_city),
                                Divider(color: Colors.black),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              LocaleKeys.status_label_text.tr(),
                              style: TextStyle(
                                  color: Colors.grey.shade900, fontSize: 18.0),
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.0)),
                            child: Column(
                              children: [
                                Divider(
                                  color: Colors.black,
                                  thickness: 0.4,
                                ),
                                UserPrefileContactDetail(
                                  info: customer.user!.role!,
                                  iconData: Icons.category,
                                ),
                                Divider(
                                  color: Colors.black,
                                  thickness: 0.4,
                                ),
                                UserPrefileContactDetail(
                                  info: customer.user!.sex!,
                                  iconData: Icons.person,
                                ),
                                Divider(color: Colors.black),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: lightColor,
                elevation: 0.0,
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: SafeArea(
                  child: Container(
                      child: Center(child: Text(LocaleKeys.something_went_wrong_label_text.tr())))));
        }
      },
    );
  }
}
