import 'dart:ui';

import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';
import 'package:cached_network_image/cached_network_image.dart';

// import 'package:app/model/category.dart';
import 'package:flutter/material.dart';

class BrokerBackgroundImage extends StatelessWidget {
  final Broker broker;
  BrokerBackgroundImage({required this.broker});
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
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: this.broker.user!.picture.toString(),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
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
                    CachedNetworkImage(
                      fit: BoxFit.contain,
                      imageUrl: this.broker.user!.picture.toString(),
                      imageBuilder: (context, imageProvider) => Container(
                        height: size.height * 0.2,
                        width: size.width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(40),
                              right: Radius.circular(40)),
                          image: DecorationImage(
                            image: imageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
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
