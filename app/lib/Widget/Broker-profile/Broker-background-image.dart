import 'dart:ui';

import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';
import 'package:cached_network_image/cached_network_image.dart';

// import 'package:app/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../Service/fireabse_service.dart';
import '../../constants.dart';

class BrokerBackgroundImage extends StatelessWidget {
  final Broker broker;
  BrokerBackgroundImage({required this.broker});
  String? imageUrl;
  Future<String> getImage(String? imageName) async {
    String imageUrl = await FirebaseService.loadImage(
        imageName.toString().substring(8), 'brokers');
    print("IMage Url: $imageUrl");
    return imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Category category =
    //     [].firstWhere((element) => element.id == broker.category!.categoryId);
    return Container(
      height: size.height * 0.3,
      child: Stack(
        children: [
          Container(
            width: size.width,
            child: FutureBuilder(
                future: getImage(this.broker.user!.picture.toString()),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
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
                        height: 12.0,
                        width: 12.0,
                        imageUrl: snapshot.data,
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
                        )),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      );
                  }
                }),
            // child: CachedNetworkImage(
            //   fit: BoxFit.fill,
            //   imageUrl: this.broker.user!.picture.toString(),
            //   imageBuilder: (context, imageProvider) => Container(
            //     width: 120.0,
            //     height: 120.0,
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       image:
            //           DecorationImage(image: imageProvider, fit: BoxFit.cover),
            //     ),
            //   ),
            //   placeholder: (context, url) => CircularProgressIndicator(),
            //   errorWidget: (context, url, error) => Icon(Icons.error),
            // ),
          ),
          ClipRRect(
            // Clip it cleanly.
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
              child: Container(
                color: Colors.grey.withOpacity(0.1),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    FutureBuilder(
                        future: getImage(this.broker.user!.picture.toString()),
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
                                fit: BoxFit.contain,
                                height: size.height * 0.2,
                                width: size.width * 0.3,
                                imageUrl: snapshot.data,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  width: 120.0,
                                  height: 120.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.contain,
                                    ),
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
                    // CachedNetworkImage(
                    //   fit: BoxFit.contain,
                    //   imageUrl: this.broker.user!.picture.toString(),
                    //   imageBuilder: (context, imageProvider) => Container(
                    //     height: size.height * 0.2,
                    //     width: size.width * 0.3,
                    //     decoration: BoxDecoration(
                    // borderRadius: BorderRadius.horizontal(
                    //     left: Radius.circular(40),
                    //     right: Radius.circular(40)),
                    //       image: DecorationImage(
                    //         image: imageProvider,
                    //         fit: BoxFit.cover,
                    //       ),
                    //     ),
                    //   ),
                    //   placeholder: (context, url) =>
                    //       CircularProgressIndicator(),
                    //   errorWidget: (context, url, error) => Icon(Icons.error),
                    // ),
                    // CircleAvatar(
                    //   maxRadius: MediaQuery.of(context).size.width * 0.15,
                    //   // minRadius: MediaQuery.of(context).size.width * 0.4,
                    //   backgroundImage: NetworkImage(
                    //       "${Ip.ip}/api/users/get/?fileName=${this.broker.user!.picture as String}"),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        broker.user!.fullName as String,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
