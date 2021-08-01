import 'package:flutter/material.dart';

class Broker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String image =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg';
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          title: Text(
            "New Broker",
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black87,
          // leading: IconButton(
          //   color: Theme.of(context).accentColor,
          //   icon: product.isFavorite
          //       ? Icon(Icons.favorite)
          //       : Icon(Icons.favorite_border),
          //   onPressed: () {
          //     product.toggleFavoriteStatus();
          //   },
          // ),
          trailing: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                print("cart pressed");
              }),
        ),
      ),
    );
  }
}
