import 'package:app/constants/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/user.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Service/fireabse_service.dart';

class UserIdentityCard extends StatelessWidget {
  const UserIdentityCard({
    required this.user,
    Key? key,
  }) : super(key: key);

  final User user;

  Future<String> getImage() async {
    String imageUrl = await FirebaseService.loadImage(
        user.identificationCard.toString().substring(19), 'IdentificationCard');
    print("IMage Url: $imageUrl");
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: FutureBuilder(
          future: getImage(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                return CachedNetworkImage(
                  fit: BoxFit.fill,
                  width: size.width,
                  height: size.height * 0.3,
                  imageUrl: snapshot.data,
                  imageBuilder: (context, imageProvider) => Container(
                    width: size.width,
                    height: size.height * 0.3,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          image: imageProvider, 
                          fit: BoxFit.cover,
                          )
                          ,
                    ),
                  ),
                  placeholder: (context, url) => Center(
                      child: SpinKitCircle(
                    color: primaryColor,
                  )),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
            }
          }),
    );
  }
}
