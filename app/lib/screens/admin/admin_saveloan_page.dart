import 'package:app/bloc/saveLoan/bloc/saveloan_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';

class AdminSaveLoan extends StatefulWidget {
  const AdminSaveLoan({Key? key}) : super(key: key);

  @override
  _AdminSaveLoanState createState() => _AdminSaveLoanState();
}

class _AdminSaveLoanState extends State<AdminSaveLoan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saveloan detail"),
      ),
      body: BlocBuilder<SaveloanBloc, SaveloanState>(
        builder: (context, state) {
          if (state is SaveloanLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SaveloanFetchSucces) {
            return Container(
              child: ListView(
                children: state.saveloan
                    .map(
                      (saveloan) => ListTile(
                        leading: CachedNetworkImage(
                          imageUrl:
                              "${Ip.ip}/api/users/get/?fileName=${saveloan.picture as String}",
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
                          )),
                          errorWidget: (context, url, _) => Icon(Icons.error),
                        ),
                        title: Text("${saveloan.fullName}"),
                        subtitle: Text("${saveloan.phone}"),
                      ),
                    )
                    .toList(),
              ),
            );
          } else {
            return Center(
              child: Text("${LocaleKeys.something_went_wrong_label_text.tr()}"),
            );
          }
        },
      ),
    );
  }
}
