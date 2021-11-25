import 'package:app/Widget/Drawer/custom_list.dart';
import 'package:app/Widget/common/broker_profile.dart';
import 'package:app/bloc/auth/bloc/auth_bloc.dart';
import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/screens/Auth/auth_exports.dart';

import 'package:app/screens/broker/broker_main_page.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';
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
        child: Drawer(child:
            BlocBuilder<BrokerBloc, BrokerState>(builder: (context, state) {
          if ((state is BrokersLoadSuccess)) {
            photoPath = state.brokers.first.user!.picture ?? photoPath;

            return ListView(
              children: [
                UserAccountsDrawerHeader(
                  accountName:
                      Text("${state.brokers.first.user!.fullName as String}"),
                  accountEmail:
                      Text("${state.brokers.first.user!.email as String}"),
                  currentAccountPicture: CachedNetworkImage(
                    imageUrl:
                        "${Ip.ip}/api/users/get/?fileName=${state.brokers.first.user!.picture as String}",
                    imageBuilder: (context, imageProvider) => Container(
                      width: 120.0,
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
                  arrowColor: Theme.of(context).accentColor,
                  decoration:
                      BoxDecoration(color: Theme.of(context).primaryColor),
                ),
                Divider(height: 20, color: Colors.white.withOpacity(0.6)),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                CustomeList(
                  title: LocaleKeys.dashboard_label_text.tr(),
                  icon: Icon(
                    Icons.dashboard,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, BrokerMain.routeName);
                  },
                  subTitle: LocaleKeys.dashboard_subtitle_label_text.tr(),
                ),
                CustomeList(
                  title: LocaleKeys.account_label_text.tr(),
                  subTitle: LocaleKeys.account_subtitle_label_text.tr(),
                  icon: Icon(
                    Icons.contact_page,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => BrokerProfile(),
                      ),
                    );
                  },
                ),
                CustomeList(
                  title: LocaleKeys.saving_and_loans_label_text.tr(),
                  subTitle:
                      LocaleKeys.saving_and_loans_subtitle_label_text.tr(),
                  icon: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, SavingAndLoan.routeName);
                  },
                ),
                ListTile(
                  title: Text(LocaleKeys.settings_label_text.tr(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  subtitle: Text(LocaleKeys.settings_label_subtitle_text.tr()),
                  leading: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
                CustomeList(
                  title: LocaleKeys.share_label_text.tr(),
                  subTitle: LocaleKeys.share_subtitle_label_text.tr(),
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    print("share");
                  },
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.23),
                Divider(height: 20, color: Colors.white.withOpacity(0.6)),
                ListTile(
                    leading: Icon(
                      Icons.logout,
                      color: Theme.of(context).errorColor,
                    ),
                    title: Text(
                      LocaleKeys.logout_label_text.tr(),
                      style: TextStyle(
                          color: Theme.of(context).errorColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      // Navigator.pop(context);
                      // Navigator.popAndPushNamed(
                      //     context, Login.routeName);
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        Login.routeName,
                        (route) => false,
                      );
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
