import 'package:app/screens/brokers_detail_screen.dart';
import 'package:flutter/material.dart';

class Broker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String image =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg/800px-Spaghetti_Bolognese_mit_Parmesan_oder_Grana_Padano.jpg';
    return InkWell(
      onTap: () {
       Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BrokersProfilePage()),
            );
      },
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: MediaQuery.of(context).size.width * 0.7,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 1,
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
                  "assets/images/16.jpg",
                  height: MediaQuery.of(context).size.height * 0.18,
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
                      "Yared Solomon",
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
                            Text('4.3 ',
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
                          '8M reviews',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.5)),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    IconButton(
                      color: Theme.of(context).primaryColor,
                      icon: Icon(
                        Icons.star_border,
                        size: MediaQuery.of(context).size.width * 0.07,
                      ),
                      onPressed: () {},
                    ),
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
