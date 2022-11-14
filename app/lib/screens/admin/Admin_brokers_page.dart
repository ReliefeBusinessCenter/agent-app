import 'package:app/Widget/common/custome_divider.dart';
import 'package:app/Widget/common/verified.dart';
import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';
import 'package:app/screens/admin/admin_broker_profile.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../Service/fireabse_service.dart';

class AdminBrokersPage extends StatefulWidget {
  static const routeName = "/AdmminCustomerPage";
  AdminBrokersPage({Key? key}) : super(key: key);

  @override
  State<AdminBrokersPage> createState() => _AdminBrokersPageState();
}

class _AdminBrokersPageState extends State<AdminBrokersPage> {
  List<int> _users = [1, 2, 3, 4, 5, 6, 7];
  Broker? _broker;
  String? imageUrl;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<BrokerBloc>(context).add(FetchEvent());
  }

  Future<String> getImage(String? pictureName,) async {
    String imageUrl = await FirebaseService.loadImage(
       pictureName.toString().substring(8), 'brokers');
    print("IMage Url: $imageUrl");
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokerBloc, BrokerState>(
      builder: (context, state) {
        if (state is BrokersLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is BrokersLoadFailed) {
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
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: state.brokers.isEmpty
                ? Center(child: Text(LocaleKeys.no_brokers_label_text.tr()))
                : Column(
                    children: state.brokers
                        .map(
                          (broker) => GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AdminBrokerProfilePage(
                                        broker: broker,
                                      )));
                            },
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 15.0),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Container(
                                        width: 50.0,
                                        child: FutureBuilder(
                        future: getImage(broker.user!.picture),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                              return Text('none');
                            case ConnectionState.waiting:
                              return Center(
                                  child: Column(
                                children: [
                                  Text("Future builder"),
                                  Center(
                                      child: SpinKitCircle(
                                    color: primaryColor,
                                  )),
                                ],
                              ));
                            case ConnectionState.active:
                              return Text('');
                            case ConnectionState.done:
                              imageUrl = snapshot.data;
                              return CachedNetworkImage(
                                fit: BoxFit.fill,
                                height: 120.0,
                                width: 120.0,
                                imageUrl: snapshot.data,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 120.0,
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
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              );
                          }
                        }),
                                      ),
                                      title: Row(
                                        children: [
                                          Text(broker.user!.fullName!),
                                          SizedBox(
                                            width: 10.0,
                                          ),
                                          if (broker.approved!) VerifiedWidget()
                                        ],
                                      ),
                                      subtitle: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Addis Ababa, Arada"),
                                          Text(broker.category!.catigoryName!)
                                        ],
                                      ),
                                      trailing: Text("12-12-2021"),
                                    ),
                                    CustomDivider()
                                  ],
                                )),
                          ),
                        )
                        .toList(),
                  ),
          ),
        );
      },
    );
  }
}
