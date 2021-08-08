import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/bloc/favorit/bloc/favorite_bloc.dart';
import 'package:app/repository/brokersRepository.dart';
import 'package:app/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data_provider/brokersDataProvider.dart';
import 'screens/login.dart';

import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // BrokersDataProvider brokersDataProvider = new BrokersDataProvider();
  BrokersRepository brokersRepository =
      new BrokersRepository(brokerDataProvider: BrokersDataProvider());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<BrokerBloc>(
            create: (_) => BrokerBloc(brokersRepository: brokersRepository)
              ..add(FetchEvent()),
          ),
          BlocProvider<FavoriteBloc>(
            create: (_) => FavoriteBloc()..add(Initial()),
          ),
        ],
        child: MaterialApp(
          title: 'DeliMeals',
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Color(0xFF015777),
              // primaryColor: Color.fromRGBO(146, 40, 105, 1),
              accentColor: Color(0xFFf2f6f9),
              canvasColor: Color.fromRGBO(225, 254, 229, 1),
              errorColor: Colors.redAccent,
              fontFamily: 'Raleway',
              textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                    color: Color.fromRGBO(255, 231, 255, 1),
                  ),
                  bodyText2: TextStyle(
                    color: Color.fromRGBO(20, 31, 51, 1),
                  ),
                  headline6:
                      TextStyle(fontSize: 24, fontFamily: 'RobotoCondensed'))),
          // home: Login(),
          initialRoute: Login.routeName,
          onGenerateRoute: AppRoutes.generateRoute,

          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (ctx) => Login());
          },

          // home: Login(),
        ));
  }
}
