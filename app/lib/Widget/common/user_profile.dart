import 'package:app/Widget/common/user_profile_edit_page.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class UserProfilePage extends StatelessWidget {
  final User user;
  static const routeName = "/userProfile";
  const UserProfilePage({required this.user, Key? key}) : super(key: key);

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
                  Navigator.of(context).pushNamed(UserProfileEditPage.routeName,
                      arguments: user);
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
                    "${Ip.ip}/api/users/get/?fileName=${user.picture as String}",
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
              SizedBox(
                height: 20.0,
              ),
              Text(
                user.fullName.toString(),
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
                            info: user.email!,
                            iconData: Icons.email_outlined,
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 0.4,
                          ),
                          UserPrefileContactDetail(
                            info: user.phone!,
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
                            info: user.role!,
                            iconData: Icons.category,
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 0.4,
                          ),
                          UserPrefileContactDetail(
                            info: user.sex!,
                            iconData: Icons.person,
                          ),
                          Divider(color: Colors.black),
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
  }
}

class UserPrefileContactDetail extends StatelessWidget {
  UserPrefileContactDetail({
    Key? key,
    required this.info,
    required this.iconData,
  }) : super(key: key);

  final String info;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          Icon(
            iconData,
            size: 25.0,
            color: Colors.black.withOpacity(0.5),
          ),
          SizedBox(
            width: 20.0,
          ),
          Text(
            info,
            style: TextStyle(fontSize: 18.0),
          )
        ],
      ),
    );
  }
}
