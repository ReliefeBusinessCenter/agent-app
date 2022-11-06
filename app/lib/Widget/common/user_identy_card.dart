import 'package:app/constants/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class UserIdentityCard extends StatelessWidget {
  const UserIdentityCard({
    required this.user,
    Key? key,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: CachedNetworkImage(
        imageUrl:
            "${Ip.ip}/api/users/get/?fileName=${user.identificationCard ?? user.picture as String}",
        imageBuilder: (context, imageProvider) => Container(
          width: size.width,
          height: size.height * 0.3,
          decoration: BoxDecoration(
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
    );
  }
}