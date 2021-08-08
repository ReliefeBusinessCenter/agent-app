import 'package:app/Widget/Dashboard/broker.dart';
import 'package:app/bloc/favorit/bloc/favorite_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
      child: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state.favorit_brokers.length != 0) {
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.6,
                  mainAxisExtent: MediaQuery.of(context).size.height * 0.35,
                ),
                itemCount: state.favorit_brokers.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                      child: BrokerItem(
                    broker: state.favorit_brokers[index],
                  ));
                });
          } else {
            return Center(child: Text("No Favorite Data found"));
          }
        },
      ),
    );
  }
}
