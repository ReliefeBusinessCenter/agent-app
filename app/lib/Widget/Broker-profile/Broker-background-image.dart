import 'package:flutter/material.dart';

class BrokerBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Card(
              elevation: 1,
              child: Container(
                  height: MediaQuery.of(context).size.height * 0.27,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white),
            ),
          ),
          Positioned(
            left: 20,
            top: MediaQuery.of(context).size.height * 0.03,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  maxRadius: MediaQuery.of(context).size.width * 0.15,
                  // minRadius: MediaQuery.of(context).size.width * 0.4,
                  backgroundImage: AssetImage('assets/images/16.jpg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Yared Solomon",
                      style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).primaryColor.withOpacity(0.95),
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('House Broker',
                          style: TextStyle(
                            fontSize: 15,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                          )),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}