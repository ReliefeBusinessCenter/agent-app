import 'package:app/Widget/common/user_profile_contact.dart';
import 'package:app/bloc/delivery/bloc/delivery_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';

import 'customer-background-image.dart';
import 'deals-button.dart';

// ignore: must_be_immutable
class CustomerProfilePage extends StatelessWidget {
  static const routeName = '/customer/detail';
  final Customer customer;
  late DeliveryBloc deliveryBloc;
  CustomerProfilePage({required this.customer});
  @override
  Widget build(BuildContext context) {
    // Broker brokedr = ModalRoute.of(context)!.settings.arguments as Broker;
    deliveryBloc = BlocProvider.of<DeliveryBloc>(context);
    deliveryBloc.add(DeliveryInitializationEvent());
    print("Broker name ${customer.user!.fullName}");
    return Scaffold(
      backgroundColor: Color(0xFFf2f6f9),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Customer Information"),
      ),
      body: ProgressHUD(
        child: BlocConsumer<DeliveryBloc, DeliveryState>(
          listener: (context, state) {
            if (state is DeliveryCreating) {
              // delivery createing
              final progress = ProgressHUD.of(context);

              progress!.showWithText("Hiring");
              print("delivery creating  method called");
            } else if (state is DeliveryCreateSuccess) {
              // delivery success method
              deliveryBloc.add(DeliveryInitializationEvent());
              Navigator.of(context).pop();
              print("Delivery create sucess method");
            } else if (state is DeliveryCreateFailed) {
              // delivery failed method
              print("Delivery create method failed");
              AwesomeDialog(
                context: context,
                dialogType: DialogType.SUCCES,
                animType: AnimType.BOTTOMSLIDE,
                title: 'Warning',
                desc: 'Failed to Create Delivers',
                btnOkOnPress: () {
                  // workBloc.add(AddWork(work: work));
                },
              )..show();
            }
          },
          builder: (context, state) {
            return _buildPortraitView(context);
          },
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 60.0,
        child: DealsButton(
          customer: customer,
        ),
      ),
    );
  }

  Widget _buildPortraitView(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var divider = Container(
      height: 2,
      width: double.infinity,
      color: Colors.grey[300],
      margin: EdgeInsets.symmetric(horizontal: 10),
    );
    return SingleChildScrollView(
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
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
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
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w600),
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
                            info: "Addis Ababa", iconData: Icons.location_city),
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
    );
  }
}
