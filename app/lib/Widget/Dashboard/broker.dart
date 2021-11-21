import 'package:app/bloc/favorit/bloc/favorite_bloc.dart';
import 'package:app/constants.dart';
import 'package:app/ip/ip.dart';
import 'package:app/model/broker/broker.dart';

import 'package:app/screens/customer/brokers_detail_screen.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BrokerItem extends StatefulWidget {
  final Broker broker;
  BrokerItem({required this.broker});

  @override
  _BrokerItemState createState() => _BrokerItemState();
}

class _BrokerItemState extends State<BrokerItem> {
  late FavoriteBloc favoriteBloc;
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    favoriteBloc = BlocProvider.of<FavoriteBloc>(context);

    return InkWell(
      onTap: () {
        print("This is the broker name ${widget.broker.user!.fullName}");
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BrokersProfilePage(
                    broker: widget.broker,
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
              ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(
                      (15),
                    ),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    height: size.height / 6,
                    width: size.width,
                    imageUrl:
                        "${Ip.ip}/api/users/get/?fileName=${widget.broker.user!.picture as String}",
                    placeholder: (context, url) => Center(
                        child: SpinKitCircle(
                      color: primaryColor,
                    )),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  )),
              Container(
                width: 300,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      this.widget.broker.user!.fullName as String,
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
                            Text("8.1${LocaleKeys.million_lable_text.tr()}",
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
                        Text(
                          "${this.widget.broker.reviews == null ? "10" : this.widget.broker.reviews![0].rate} ${LocaleKeys.million_lable_text.tr()} ${LocaleKeys.views_lable_text.tr()}",
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    BlocBuilder<FavoriteBloc, FavoriteState>(
                      builder: (context, state) {
                        if (state.favorit_brokers.contains(widget.broker)) {
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
                              Broker broker = widget.broker;
                              broker.isFavorite = true;
                              favoriteBloc.add(Favorite(broker: broker));
                            } else {
                              Broker broker = widget.broker;
                              broker.isFavorite = false;
                              favoriteBloc.add(UnFavorite(broker: broker));
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
