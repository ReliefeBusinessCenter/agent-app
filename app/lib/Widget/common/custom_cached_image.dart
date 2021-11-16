import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  CustomCachedNetworkImage(
      {Key? key, required this.image, required this.isTopBorderd})
      : super(key: key);

  final String image;
  final bool isTopBorderd;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CachedNetworkImage(
      imageUrl: image,
      errorWidget: (context, url, error) => Container(
        decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(12.0)),
        child: Center(
            child: Icon(
          Icons.image,
          color: Theme.of(context).secondaryHeaderColor.withOpacity(0.6),
          size: 100.0,
        )),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: SpinKitCircle(
          color: Theme.of(context).primaryColor,
          duration: Duration(
              seconds: downloadProgress.progress == null
                  ? 2
                  : downloadProgress.progress!.toInt()),
        ),
      ),
      // CircularProgressIndicator(
      //     value: downloadProgress.progress),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: isTopBorderd
              ? BorderRadius.circular(12)
              : BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0)),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
