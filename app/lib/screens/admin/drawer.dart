
import 'package:app/Widget/Drawer/custom_list.dart';
import 'package:app/bloc/auth/bloc/auth_bloc.dart';
import 'package:app/ip/ip.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/screens/Auth/login.dart';
import 'package:app/screens/admin/admin_deals_page.dart';
import 'package:app/screens/admin/admin_delivery_page.dart';
import 'package:app/screens/customer/account_screen.dart';
import 'package:app/screens/customer/becomeAnAgent.dart';
import 'package:app/screens/customer/customerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



UserPreferences pref = UserPreferences();

class AdminDrawer extends StatefulWidget {
  

  @override
  _AdminDrawerState createState() => _AdminDrawerState();
}

class _AdminDrawerState extends State<AdminDrawer> {
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
                        return ListView(
                          children: [

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
                              title: "Category",
                              subTitle: "see categories",
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
                              title: "Deals",
                              subTitle: "see deals",
                              icon: Icon(
                                Icons.support_agent,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                print("Setting apge");
                                Navigator.pushNamed(
                                    context, AdminDealPage.routeName);
                              },
                            ),
                             CustomeList(
                              title: "Delivery",
                              subTitle: "see delivery",
                              icon: Icon(
                                Icons.support_agent,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                print("Setting apge");
                                Navigator.pushNamed(
                                    context, AdminDeliveryPage.routeName);
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
                            
                          ],
                        );
                      }
                      return Container();
                    })))
                    
                    );
  }
}
