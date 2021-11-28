import 'package:app/Widget/common/custome_divider.dart';
import 'package:app/bloc/saveLoan/bloc/saveloan_bloc.dart';
import 'package:app/constants/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/screens/admin/admin_save_loan_detail.dart';
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
  void initState() {
    BlocProvider.of<SaveloanBloc>(context).add(SaveLoanFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Saveloan detail"),
        backgroundColor: primaryColor,
      ),
      body: BlocBuilder<SaveloanBloc, SaveloanState>(
        builder: (context, state) {
          print("Saveloan state $state");
          if (state is SaveloanLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SaveloanFetchSucces) {
            return state.saveloan.isEmpty ?Center(child: Text("No Save loans yet!"),): Container(
              child: ListView(
                children: state.saveloan
                    .map(
                      (saveloan) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  AdminSaveloanDetail(saveloan)));
                        },
                        child: Column(
                          children: [
                            ListTile(
                              leading: Container(
                                width: 50.0,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      "${Ip.ip}/api/users/get/?fileName=${saveloan.picture as String}",
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    width: 120,
                                    height: 120.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  placeholder: (context, url) => Center(
                                      child: SpinKitCircle(
                                    color: primaryColor,
                                  )),
                                  errorWidget: (context, url, _) =>
                                      Icon(Icons.error),
                                ),
                              ),
                              title: Text("${saveloan.fullName}"),
                              subtitle: Text("${saveloan.phone}"),
                            ),
                            CustomDivider()
                          ],
                        ),
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
