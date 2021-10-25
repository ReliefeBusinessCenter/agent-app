import 'package:app/Widget/Drawer/custom_list.dart';
import 'package:app/bloc/auth/bloc/auth_bloc.dart';
import 'package:app/ip/ip.dart';
import 'package:app/screens/Auth/auth_exports.dart';

import 'package:app/screens/broker/broker_account_screen.dart';
import 'package:app/screens/broker/broker_main_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    if (state.user.user != null) {
                      if (state.user.user!.picture != null) {
                        if (state.user.user!.picture != null) {
                          print(
                              "++++++++Have Image: ${state.user.user!.picture as String}");
                          photoPath = state.user.user!.picture ?? photoPath;
                          photo = CircleAvatar(
                            radius: 45,
                            backgroundColor: Colors.white,
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              child: Image(
                                image: NetworkImage(
                                  "${Ip.ip}/api/users/get/?fileName=${state.user.user!.picture as String}",

                                  // fit: BoxFit.fill,
                                  // placeholder: (context, url) => Container(
                                  //   color: Colors.white,
                                  // ),
                                  // errorWidget: (context, url, error) =>
                                  //     Container(
                                  //   color: Colors.black,
                                  //   child: Icon(Icons.error),
                                  // ),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: double.infinity,
                              ),
                              // child: Image.network('${baseUrl}/${client.photoPath}'),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          );
                        } else {
                          photo = CircleAvatar(
                            radius: 45,
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              child: Image.asset('assets/images/circular.png'),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
                          );
                        }
                      } else {
                        photo = CircleAvatar(
                          radius: 45,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            child: Image.asset('assets/images/circular.png'),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        );
                      }
                    } else {
                      photo = CircleAvatar(
                        radius: 45,
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          child: Image.asset('assets/images/circular.png'),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      );
                    }
                    return Column(
                      children: [
                        UserAccountsDrawerHeader(
                          accountName:
                              Text("${state.user.user!.fullName as String}"),
                          accountEmail:
                              Text("${state.user.user!.email as String}"),
                          currentAccountPicture: photo,
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
                                context, BrokerAccountScreen.routeName);
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
