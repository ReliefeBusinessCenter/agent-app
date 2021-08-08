import 'package:app/bloc/favorit/bloc/favorite_bloc.dart';
import 'package:app/model/broker.dart';
import 'package:app/screens/brokers_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    favoriteBloc = BlocProvider.of<FavoriteBloc>(context);
    String image =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg';
    return InkWell(
      onTap: () {
        print("This is the broker name ${widget.broker.name}");
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
                child: Image.asset(
                  this.widget.broker.image,
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                width: 300,
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Text(
                      this.widget.broker.name,
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
                            Text("${this.widget.broker.rating}",
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
                          "${this.widget.broker.view}M views",
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
