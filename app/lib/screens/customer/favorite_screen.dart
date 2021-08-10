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
        // buildWhen: (previous, current) =>
        //     previous.favorit_brokers == current.favorit_brokers,
        builder: (context, state) {
          if (state is FavoriteState) {
            if (state is FavoriteState) {
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
          } else if (state is UnFavoriteSuccess) {
            if (state is FavoriteState) {
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
          }
          return Container();
        },
      ),
    );
  }
}
