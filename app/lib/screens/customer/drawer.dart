// import 'package:app/Widget/Drawer/custom_list.dart';
// import 'package:app/ip/ip.dart';
// import 'package:app/model/broker/user.dart';
// import 'package:app/model/login_info.dart';
// import 'package:app/preferences/user_preference_data.dart';
// import 'package:app/screens/Auth/login.dart';

// import 'package:flutter/material.dart';

// import 'account_screen.dart';
// import 'becomeAnAgent.dart';
// import 'customerPage.dart';

// class CustomerDrawer extends StatelessWidget {
//   User user = new User();
//   void Initializeuser() async {
//     UserPreferences userPreference = new UserPreferences();
//     LoggedUserInfo? loggedUserInfo = await userPreference.getUserInformation();
//     print("User Object from the Drawer: ${loggedUserInfo!.user!.fullName}");
//     this.user = loggedUserInfo.user as User;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Initializeuser();
//      Widget photo;
//     return Container(
//       color: Theme.of(context).primaryColor,
//       width: MediaQuery.of(context).size.width * 0.6,
//       child: Column(
//         children: [

//           UserAccountsDrawerHeader(
//             accountName: Text("${this.user.fullName as String}"),
//             accountEmail: Text("${this.user.email as String}"),
//             currentAccountPicture: CircleAvatar(
//               backgroundImage: NetworkImage(
//                  "${Ip.ip}/api/users/get/?fileName=${this.user.picture as String}"),
//             ),
//             arrowColor: Theme.of(context).accentColor,
//             decoration: BoxDecoration(color: Theme.of(context).primaryColor),
//           ),
//           CustomeList(
//             title: "Dashboard",
//             subTitle: "See List of brokers",
//             icon: Icon(
//               Icons.dashboard,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               Navigator.pushNamed(context, CustomerPage.routeName);
//             },
//           ),
//           CustomeList(
//             title: "Account",
//             subTitle: "Update Profile",
//             icon: Icon(
//               Icons.contact_page,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => AccountScreen()),
//               );
//             },
//           ),
//           CustomeList(
//             title: "Agent",
//             subTitle: "Become an agent",
//             icon: Icon(
//               Icons.support_agent,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               print("Setting apge");
//               Navigator.pushNamed(context, BecomeAnAgent.routeName);
//             },
//           ),
//           ListTile(
//             title: Text("Settings",
//                 style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15)),
//             leading: Icon(
//               Icons.settings,
//               color: Colors.white,
//             ),
//           ),
//           CustomeList(
//             title: "Share",
//             subTitle: "Share this app",
//             icon: Icon(
//               Icons.share,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               print("share");
//             },
//           ),
//           Divider(height: 20, color: Colors.white.withOpacity(0.6)),
//           ListTile(
//               leading: Icon(
//                 Icons.logout,
//                 color: Theme.of(context).errorColor,
//               ),
//               title: Text(
//                 'Log Out',
//                 style: TextStyle(
//                     color: Theme.of(context).errorColor,
//                     fontSize: 15,
//                     fontWeight: FontWeight.bold),
//               ),
//               onTap: () {
//                 // Navigator.pop(context);
//                 Navigator.popAndPushNamed(context, Login.routeName);
//               }),
//           Divider(
//             height: 20,
//           ),
//           ListTile(
//             trailing: Icon(Icons.close, color: Colors.white.withOpacity(0.7)),
//             title: Text(
//               'Close',
//               style: TextStyle(
//                 fontSize: 15,
//                 color: Colors.white.withOpacity(0.7),
//                 fontWeight: FontWeight.w300,
//               ),
//             ),
//             onTap: () {
//               Navigator.of(context).pop();
//             },
//           )
//         ],
//       ),
//     );
//   }

//   void goToProfilePage(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => AccountScreen()),
//     );
//   }
// }

// import 'home_screen.dart';

import 'package:app/Widget/Drawer/custom_list.dart';
import 'package:app/bloc/auth/bloc/auth_bloc.dart';
import 'package:app/ip/ip.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/screens/Auth/login.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'account_screen.dart';
import 'becomeAnAgent.dart';
import 'customerPage.dart';

UserPreferences pref = UserPreferences();

class AppDrawer extends StatefulWidget {
  // final Function onPressed;
  // AppDrawer({required this.onPressed});
  // late int selectedDrawer;

  // AppDrawer({
  //   required this.selectedDrawer,
  // });

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  // late CartBloc cartBloc;
  @override
  void initState() {
    super.initState();
  }

  String photoPath = "assets/images/circular.png";

  @override
  Widget build(BuildContext context) {
    // cartBloc = BlocProvider.of<CartBloc>(context);
    Widget photo;
    // final cubit = BlocProvider.of<LanguageCubit>(context);

    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context)
              .primaryColor, //This will change the drawer background to blue.
          //other styles
        ),
        child: Container(
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
                                    height: MediaQuery.of(context).size.height *
                                        0.18,
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
                                  child:
                                      Image.asset('assets/images/circular.png'),
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
                                child:
                                    Image.asset('assets/images/circular.png'),
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
                            // child: Column(
//         children: [

                            UserAccountsDrawerHeader(
                              accountName: Text(
                                  "${state.user.user!.fullName as String}"),
                              accountEmail:
                                  Text("${state.user.user!.email as String}"),
                              currentAccountPicture: photo,
                              arrowColor: Theme.of(context).accentColor,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor),
                            ),
                            Divider(
                                height: 20,
                                color: Colors.white.withOpacity(0.6)),
                            CustomeList(
                              title: "Dashboard",
                              subTitle: "See List of brokers",
                              icon: Icon(
                                Icons.dashboard,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, CustomerPage.routeName);
                              },
                            ),
                            CustomeList(
                              title: "Account",
                              subTitle: "Update Profile",
                              icon: Icon(
                                Icons.contact_page,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AccountScreen()),
                                );
                              },
                            ),
                            CustomeList(
                              title: "Agent",
                              subTitle: "Become an agent",
                              icon: Icon(
                                Icons.support_agent,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                print("Setting apge");
                                Navigator.pushNamed(
                                    context, BecomeAnAgent.routeName);
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
                                height:
                                    MediaQuery.of(context).size.height * 0.23),
                            Divider(
                                height: 20,
                                color: Colors.white.withOpacity(0.6)),
                            Container(
                              alignment: Alignment.bottomCenter,
                              child: ListTile(
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
                            ),
                            // Divider(
                            //   height: 20,
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
                    }))));
  }
}
