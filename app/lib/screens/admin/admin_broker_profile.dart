import 'package:app/Widget/broker-widget/accept_button.dart';
import 'package:app/Widget/broker-widget/reject_button.dart';
import 'package:app/Widget/common/loading_indicator.dart';
import 'package:app/Widget/common/user_profile_contact.dart';
import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AdminBrokerProfilePage extends StatefulWidget {
  final Broker? broker;

  // int? id;
  AdminBrokerProfilePage({this.broker, Key? key}) : super(key: key);

  @override
  State<AdminBrokerProfilePage> createState() => _AdminBrokerProfilePageState();
}

class _AdminBrokerProfilePageState extends State<AdminBrokerProfilePage> {
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
          PopupMenuButton(
            child: Icon(
              Icons.more_vert,
              color: primaryColor,
            ),
            onSelected: (index) {
              if (index == 1) {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Confirm Us',
                  desc: 'Are you sure you want to delete this broker?',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    BlocProvider.of<BrokerBloc>(context)
                        .add(DeleteBrokerEvent(widget.broker!.brokerId!));
                    Navigator.pop(context);
                  },
                )..show();
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text("Delete"),
                value: 1,
              )
            ],
          )
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
            Navigator.of(context).pop();
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
                        "${Ip.ip}/api/users/get/?fileName=${widget.broker!.user!.picture as String}",
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
                    widget.broker!.user!.fullName.toString(),
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
                                info: widget.broker!.user!.email!,
                                iconData: Icons.email_outlined,
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.4,
                              ),
                              UserPrefileContactDetail(
                                info: widget.broker!.user!.phone!,
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
                                info: widget.broker!.user!.role!,
                                iconData: Icons.category,
                              ),
                              Divider(
                                color: Colors.black,
                                thickness: 0.4,
                              ),
                              UserPrefileContactDetail(
                                info: widget.broker!.user!.sex!,
                                iconData: Icons.person,
                              ),
                              Divider(color: Colors.black),
                              SizedBox(
                                height: 30,
                              ),
                              SizedBox(
                                width: size.width * 0.6,
                                child: AcceptButton(
                                  title: "Approve Broker",
                                  onPressed: () {
                                    BlocProvider.of<BrokerBloc>(context).add(
                                        UpdateBrokerEvent(
                                            widget.broker!, true));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              SizedBox(
                                width: size.width * 0.6,
                                child: RejectButton(
                                  title: 'Reject Broker',
                                  onPressed: () {
                                    debugPrint("Rejecting Broker");
                                    BlocProvider.of<BrokerBloc>(context).add(
                                        UpdateBrokerEvent(
                                            widget.broker!, false));
                                    debugPrint("Rejected Broker");
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              )
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
