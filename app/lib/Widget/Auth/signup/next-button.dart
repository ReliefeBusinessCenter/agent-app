import 'package:app/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
class Next extends StatelessWidget {
  // late OrdersBloc ordersBloc;
  // List<Data> products;
  // Checkout({required this.products});
  final VoidCallback onTapped;
  Next({required this.onTapped});
  @override
  Widget build(BuildContext context) {
    // ordersBloc = BlocProvider.of<OrdersBloc>(context);
    return GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(LocaleKeys.next_btn_label_text.tr(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        onTap: () {
          // Navigator.pop(context);
          this.onTapped();
        });
  }
}
