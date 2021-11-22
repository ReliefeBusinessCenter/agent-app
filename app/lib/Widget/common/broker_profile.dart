import 'package:app/Widget/common/broker_profile_edit.dart';
import 'package:app/Widget/common/loading_indicator.dart';
import 'package:app/Widget/common/user_profile_contact.dart';
import 'package:app/Widget/common/user_profile_edit_page.dart';
import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: must_be_immutable
class BrokerProfile extends StatefulWidget {
  final Broker broker;
  static const routeName = "/userProfile";
  BrokerProfile({
    required this.broker,
    Key? key,
  }) : super(key: key);

  @override
  State<BrokerProfile> createState() => _BrokerProfileState();
}

class _BrokerProfileState extends State<BrokerProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30.0),
            child: CircleAvatar(
              backgroundColor: primaryColor,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => BrokerProfileEditPage(broker: widget.broker))
                  );
                },
                icon: Icon(Icons.edit),
              ),
            ),
          ),
        ],
      ),
      body: BlocConsumer<BrokerBloc, BrokerState>(
        listener: (context, state) {
          if (state is BrokersLoading) {
            
              showDialog(
                context: context,
                builder: (context) => LoadingIndicator(
                  name: 'Updating',
                  leadingWidget: SpinKitCircle(
                    color: primaryColor,
                  ),
                ),
              );
          } else if (state is BrokersLoadFailed) {
           
              showDialog(
                context: context,
                builder: (context) => LoadingIndicator(
                  name: 'Something went wrong',
                  leadingWidget: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              );
          } else {
              Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Container(
              color: lightColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        "${Ip.ip}/api/users/get/?fileName=${widget.broker.user!.picture as String}",
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
                    widget.broker.user!.fullName.toString(),
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
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
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Contact Details',
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
                                info: widget.broker.user!.email!,
                                iconData: Icons.email_outlined,
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.4,
                              ),
                              UserPrefileContactDetail(
                                info: widget.broker.user!.phone!,
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
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            'Status',
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
                                info: widget.broker.user!.role!,
                                iconData: Icons.category,
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.4,
                              ),
                              UserPrefileContactDetail(
                                info: widget.broker.user!.sex!,
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
          );
        },
      ),
    );
  }
}
