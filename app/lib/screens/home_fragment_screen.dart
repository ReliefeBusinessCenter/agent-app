import 'package:app/Widget/Dashboard/broker.dart';
import 'package:app/Widget/Dashboard/customCategory.dart';
import 'package:app/Widget/Dashboard/customSearchBar.dart';
import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFf2f6f9),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SearchTextField(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  CustomCategory(
                    text: "All",
                    onPressed: () {},
                  ),
                  CustomCategory(
                    text: "House",
                    onPressed: () {},
                  ),
                  CustomCategory(
                    text: "Electronics",
                    onPressed: () {},
                  ),
                  CustomCategory(
                    text: "Home Maid",
                    onPressed: () {},
                  ),
                  CustomCategory(
                    text: "Car",
                    onPressed: () {},
                  ),
                  CustomCategory(
                    text: "Other",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Broker(),
                        Broker(),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Broker(),
                        Broker(),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Broker(),
                        Broker(),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Broker(),
                        Broker(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
