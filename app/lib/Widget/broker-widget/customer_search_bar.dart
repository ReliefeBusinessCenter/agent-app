// import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/bloc/customer/customer_bloc.dart';
import 'package:app/constants/login/size.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerSearchTextField extends StatelessWidget {
  late CustomerBloc customerBloc;
  @override
  Widget build(BuildContext context) {
    customerBloc = BlocProvider.of<CustomerBloc>(context);
    LoginSize loginSize = new LoginSize();
    loginSize.build(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Center(
          child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(40)),
              width: MediaQuery.of(context).size.width * 0.8,
              child: BlocBuilder<CustomerBloc, CustomerState>(
                builder: (context, state) {
                  return TextField(
                    onChanged: (text) {
                      print("This is the text that have been written $text");
                      customerBloc.add(SearchEvent(name: text));
                    },
                    controller: null,
                    // obscureText: !ispassshow,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    onEditingComplete: () => FocusScope.of(context).unfocus(),
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 14),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      // suffixIcon: IconButton(
                      //   icon: Icon(ispassshow
                      //       ? Icons.visibility
                      //       : Icons.visibility_off),
                      //   onPressed: () {
                      //     setState(() {
                      //       ispassshow = !ispassshow;
                      //     });
                      //   },
                      // ),
                      hintText: " Search Customers",
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.3)),
                    ),
                  );
                },
              )),
        ),
        PopupMenuButton(
            child: Icon(Icons.more_vert,
                color: Theme.of(context).primaryColor,
                size: MediaQuery.of(context).size.height * 0.035),
            onSelected: (value) async {
              if (value == 1) {
                // make it done
                //  update delivery
                // dealsBloc.add(MarkAsAccepted(deals: deals));
              } else {
                // delete the work history.
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  animType: AnimType.BOTTOMSLIDE,
                  title: 'Confirm Us',
                  desc: 'Are you sure you want to Reject  this work?',
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    // dealsBloc.add(MarkAsRejected(work: deals));
                  },
                )..show();
              }
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text("All",
                        style:
                            TextStyle(color: Theme.of(context).primaryColor)),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Text("Favorite",
                        style: TextStyle(color: Colors.amberAccent)),
                    value: 2,
                  ),
                ]),
      ],
    );
  }
}
