import 'package:app/Widget/customer/customer-profile-page.dart';
import 'package:app/bloc/favorit/bloc/favorite_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/customer/customer.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomerItem extends StatefulWidget {
  final Customer customer;
  CustomerItem({required this.customer});

  @override
  _CustomerItemState createState() => _CustomerItemState();
}

class _CustomerItemState extends State<CustomerItem> {
  late FavoriteBloc favoriteBloc;
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    final size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () {
        print("This is the broker name ${widget.customer.user!.fullName}");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CustomerProfilePage(
                    customer: widget.customer,
                  )),
        );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.width * 0.7,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0.5,
          margin: EdgeInsets.all(10),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ClipRRect(
              //   borderRadius: BorderRadius.only(
              //     topLeft: Radius.circular(15),
              //     topRight: Radius.circular(
              //       (15),
              //     ),
              //   ),
              //   child: Image.network(
              //     "${Ip.ip}/api/users/get/?fileName=${widget.customer.user!.picture as String}",
              //     height: MediaQuery.of(context).size.height * 0.20,
              //     width: double.infinity,
              //     fit: BoxFit.fill,
              //   ),
              // ),
              CachedNetworkImage(
                imageUrl:
                    "${Ip.ip}/api/users/get/?fileName=${widget.customer.user!.picture as String}",
                imageBuilder: (context, imageProvider) {
                  return Container(
                    // width: 120,
                    height: size.height * 0.20,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  );
                },
                placeholder: (context, url) => Center(
                  child: SpinKitCircle(
                    color: primaryColor,
                  ),
                ),
                errorWidget: (context, url, _) =>
                    Center(child: Icon(Icons.error)),
              ),
              Container(
                width: 300,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      this.widget.customer.user!.fullName as String,
                      style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor.withOpacity(0.95),
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Text("8.1 ${LocaleKeys.million_lable_text.tr()}",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5))),
                            Icon(Icons.star,
                                color: Colors.amberAccent,
                                size: MediaQuery.of(context).size.width * 0.04),
                          ],
                        ),
                        SizedBox(
                          width: 6,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    BlocBuilder<FavoriteBloc, FavoriteState>(
                      builder: (context, state) {
                        if (state.favorit_brokers.contains(widget.customer)) {
                          this.isFav = true;
                        } else {
                          this.isFav = false;
                        }
                        return IconButton(
                          color: Theme.of(context).primaryColor,
                          icon: Icon(
                            this.isFav == false
                                ? Icons.star_border
                                : Icons.star,
                            size: MediaQuery.of(context).size.width * 0.07,
                          ),
                          onPressed: () {
                            if (isFav == false) {
                              Customer customer = widget.customer;
                              customer.isFavorite = true;
                              // favoriteBloc.add(Favorite(broker: broker));
                            } else {
                              Customer customer = widget.customer;
                              customer.isFavorite = false;
                              // favoriteBloc.add(UnFavorite(broker: broker));
                            }

                            setState(() {
                              isFav = !isFav;
                            });
                          },
                        );
                      },
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
