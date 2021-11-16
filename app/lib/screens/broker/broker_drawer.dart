import 'package:app/Widget/Drawer/custom_list.dart';
import 'package:app/Widget/common/user_profile.dart';
import 'package:app/bloc/auth/bloc/auth_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/screens/Auth/auth_exports.dart';

import 'package:app/screens/broker/broker_account_screen.dart';
import 'package:app/screens/broker/broker_main_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'saving_and_loans.dart';

class BrokerDrawer extends StatefulWidget {
  @override
  _BrokerDrawerState createState() => _BrokerDrawerState();
}

class _BrokerDrawerState extends State<BrokerDrawer> {
  bool status = false;
  String photoPath = "assets/images/circular.png";
  @override
  Widget build(BuildContext context) {
    Widget photo;
    
    return Container(
        width: MediaQuery.of(context).size.width * 0.60,
        child: Drawer(
            child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if ((state is LoginSuccessState)) {
                    photoPath = state.user.user!.picture ?? photoPath;
                    
                    return ListView(
                      children: [
                        UserAccountsDrawerHeader(
                          accountName:
                              Text("${state.user.user!.fullName as String}"),
                          accountEmail:
                              Text("${state.user.user!.email as String}"),
                          currentAccountPicture:  CachedNetworkImage(
                imageUrl:
                    "${Ip.ip}/api/users/get/?fileName=${state.user.user!.picture as String}",
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
                  child: SpinKitCircle( color: primaryColor,),
                ),
                errorWidget: (context, url, _) => Icon(Icons.error),
              ),
                          arrowColor: Theme.of(context).accentColor,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor),
                        ),
                        Divider(
                            height: 20, color: Colors.white.withOpacity(0.6)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03),
                        CustomeList(
                          title: "Dashboard",
                          icon: Icon(
                            Icons.dashboard,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, BrokerMain.routeName);
                          },
                          subTitle: '',
                        ),
                        CustomeList(
                          title: "Account",
                          subTitle: "Update Profile",
                          icon: Icon(
                            Icons.contact_page,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, UserProfilePage.routeName, arguments: state.user.user);
                          },
                        ),
                        CustomeList(
                          title: "Saving and Loans",
                          subTitle: "Wallet",
                          icon: Icon(
                            Icons.attach_money,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, SavingAndLoan.routeName);
                          },
                        ),
                        ListTile(
                          title: Text("Settings",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15)),
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                        ),
                        CustomeList(
                          title: "Share",
                          subTitle: "Share this app",
                          icon: Icon(
                            Icons.share,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            print("share");
                          },
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.23),
                        Divider(
                            height: 20, color: Colors.white.withOpacity(0.6)),
                        ListTile(
                            leading: Icon(
                              Icons.logout,
                              color: Theme.of(context).errorColor,
                            ),
                            title: Text(
                              'Log Out',
                              style: TextStyle(
                                  color: Theme.of(context).errorColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                            onTap: () {
                              // Navigator.pop(context);
                              Navigator.popAndPushNamed(
                                  context, Login.routeName);
                            }),
                        // SizedBox(
                        //   height: MediaQuery.of(context).size.height * 0.09,
                        // ),
                        // ListTile(
                        //   trailing: Icon(Icons.close,
                        //       color: Colors.white.withOpacity(0.7)),
                        //   title: Text(
                        //     'Close',
                        //     style: TextStyle(
                        //       fontSize: 15,
                        //       color: Colors.white.withOpacity(0.7),
                        //       fontWeight: FontWeight.w300,
                        //     ),
                        //   ),
                        //   onTap: () {
                        //     Navigator.of(context).pop();
                        //   },
                        // )
                      ],
                    );
                  }
                  return Container();
                })));
  }
}
