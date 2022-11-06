import 'package:app/constants/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/save_loan.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AdminSaveloanDetail extends StatelessWidget {
  final SaveLoan saveLoan;
  const AdminSaveloanDetail(this.saveLoan, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("saveloan detail"),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl:
                    "${Ip.ip}/api/users/get/?fileName=${saveLoan.picture as String}",
                imageBuilder: (context, imageProvider) => Container(
                  width: 80.0,
                  height: 80.0,
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
                errorWidget: (context, url, _) => Icon(Icons.error),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text("${saveLoan.fullName}",
                  style:
                      TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              SizedBox(height: 10.0),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.phone),
                SizedBox(
                  width: 10.0,
                ),
                Text(saveLoan.phone.toString()),
              ]),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Id Card",
                    style: TextStyle(
                        color: primaryColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  CachedNetworkImage(
                    imageUrl:
                        "${Ip.ip}/api/users/get/?fileName=${saveLoan.identificationCard as String}",
                    imageBuilder: (context, imageProvider) => Container(
                      width: size.width * 0.6,
                      height: size.height * 0.3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    placeholder: (context, url) => Center(
                        child: SpinKitCircle(
                      color: primaryColor,
                    )),
                    errorWidget: (context, url, _) => Icon(Icons.error),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
