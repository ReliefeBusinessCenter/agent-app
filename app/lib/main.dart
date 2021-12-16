import 'package:app/bloc/broker/bloc/broker_bloc.dart';
import 'package:app/bloc/city/bloc/city_bloc.dart';
import 'package:app/bloc/delivery/bloc/delivery_bloc.dart';
import 'package:app/bloc/favorit/bloc/favorite_bloc.dart';
import 'package:app/bloc/saveLoan/bloc/saveloan_bloc.dart';
import 'package:app/bloc/work-deals/bloc/workdeals_bloc.dart';
// import 'package:app/bloc/work/bloc/work_bloc.dart';
import 'package:app/data_provider/broker-data-provider.dart';
import 'package:app/data_provider/city_data_provider.dart';
import 'package:app/data_provider/customer-data-provider.dart';
import 'package:app/data_provider/deals_data_provider.dart';
import 'package:app/data_provider/delivery-data-provider.dart';
import 'package:app/data_provider/save_and_loan_data_provider.dart';
import 'package:app/preferences/user_preference_data.dart';
import 'package:app/repository/brokersRepository.dart';
import 'package:app/repository/category_repository.dart';
import 'package:app/repository/city_repository.dart';
import 'package:app/repository/customer_repository.dart';
import 'package:app/repository/deals_repository.dart';
import 'package:app/repository/delivery_repository.dart';
import 'package:app/repository/save_loan_repository.dart';
import 'package:app/repository/user_repository.dart';
import 'package:app/routes/route.dart';
import 'package:app/screens/Auth/login.dart';
import 'package:app/screens/splash_screen.dart';
import 'package:app/screens/welcome/welcome_page.dart';
import 'package:app/translations/codegen_loader.g.dart';
import 'package:app/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'bloc/auth/bloc/auth_bloc.dart';
import 'bloc/category/bloc/category_bloc.dart';

import 'bloc/customer/customer_bloc.dart' as customerBloc;
import 'bloc/deals/bloc/deals_bloc.dart';
import 'bloc/register/bloc/register_bloc.dart';
import 'bloc/work-delivery/bloc/work_bloc.dart';
import 'data_provider/categories_data_provider.dart';
import 'data_provider/user_data_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: [
      Locale('en'),
      
      Locale('am'),
    ],
    assetLoader: CodegenLoader(),
    fallbackLocale: Locale('en'),
    path: 'assets/translations',
    startLocale: Locale('am'),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // BrokersDataProvider brokersDataProvider = new BrokersDataProvider();
  http.Client httpClient = http.Client();
  CityRepository cityRepository = CityRepository(
    cityDataProvider: CityDataProvider(
      httpClient: http.Client(),
    ),
  );
  BrokersRepository brokersRepository = new BrokersRepository(
      brokerDataProvider: BrokerDataProvider(
    httpClient: http.Client(),
    userPreferences: UserPreferences(),
  ));

  UserRepository userRepository = UserRepository(
    userDataProvider: UserDataProvider(
        httpClient: http.Client(),
        userPreferences: UserPreferences(),
        brokerRepository: new BrokersRepository(
            brokerDataProvider: BrokerDataProvider(
          httpClient: http.Client(),
          userPreferences: UserPreferences(),
        )),
        customerRepository: CustomerRepository(
            customerDataProvider: CustomerDataProvider(
          httpClient: http.Client(),
          userPreferences: UserPreferences(),
        ))),
  );

  CategoryRepository categoryRepository = CategoryRepository(
    categoryDataProvider: CategoriesDataProvider(
      httpClient: http.Client(),
      userPreferences: UserPreferences(),
    ),
  );

  CustomerRepository customerRepository = new CustomerRepository(
      customerDataProvider: CustomerDataProvider(
    httpClient: http.Client(),
    userPreferences: UserPreferences(),
  ));

  DeliveryRepository deliveryRepo = new DeliveryRepository(
      deliveryDataProvider: DeliveryDataProvider(
    httpClient: http.Client(),
    userPreferences: UserPreferences(),
  ));

  DealsRepository dealsRepo = new DealsRepository(
      dealsDataProvider: DealsDataProvider(
    httpClient: http.Client(),
    userPreferences: UserPreferences(),
  ));

  SaveLoanRepository saveLoanRepository = SaveLoanRepository(
      saveLoanDataProvider: SaveLoanDataProvider(httpClient: http.Client()));

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<SaveloanBloc>(
            create: (_) => SaveloanBloc(
              saveLoanRepository: saveLoanRepository,
            )..add(SaveLoanFetchEvent()),
          ),
          BlocProvider<CityBloc>(
              create: (_) => CityBloc(
                    cityRepository: cityRepository,
                  )..add(FetchCities())),
          BlocProvider<BrokerBloc>(
              create: (_) => BrokerBloc(brokersRepository: brokersRepository)
                ..add(FetchEvent())),

          BlocProvider<AuthBloc>(
            create: (_) => AuthBloc(
              userRepository: this.userRepository,
              userPreference: UserPreferences(),
            )..add(AutoLoginEvent()),
          ),

          BlocProvider<customerBloc.CustomerBloc>(
              create: (_) => customerBloc.CustomerBloc(
                  customerRepository: customerRepository)
                ..add(customerBloc.FetchEvent())),
          BlocProvider<DeliveryBloc>(
            create: (_) => DeliveryBloc(
              deliveryRepository: this.deliveryRepo,
              // customerRepository: this.customerRepository
            )..add(DeliveryInitializationEvent()),
          ),
          // BlocProvider<DeliveryBloc>(
          //   create: (_) => DeliveryBloc(
          //     deliveryRepository: this.deliveryRepo,
          //     // customerRepository: this.customerRepository
          //   )..add(DeliveryInitializationEvent()),
          // ),

          BlocProvider<DealsBloc>(
            create: (_) => DealsBloc(
              dealsRepository: this.dealsRepo,
              // customerRepository: this.customerRepository
            )..add(DealsInitializationEvent()),
          ),

          //

          BlocProvider<CategoryBloc>(
            create: (_) => CategoryBloc(
              categoryRepository: this.categoryRepository,
            )..add(FetchCategories()),
          ),
          //
          BlocProvider<FavoriteBloc>(
            create: (_) => FavoriteBloc()..add(FavoriteInitialFetch()),
          ),
          BlocProvider<WorkBloc>(
            create: (_) => WorkBloc(
                customerRepository: customerRepository,
                brokerRepository: brokersRepository,
                deliveryRepository: deliveryRepo)
              ..add(WorkInitialFetch()),
          ),
          BlocProvider<DealsListBloc>(
            create: (_) => DealsListBloc(
                customerRepository: customerRepository,
                brokerRepository: brokersRepository,
                dealsRepository: dealsRepo)
              ..add(DealsInitialFetch()),
          ),
          BlocProvider<RegisterBloc>(
            create: (_) => RegisterBloc(
                brokersRepository: brokersRepository,
                customerRepositoy: customerRepository)
              ..add(Initialization()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: LocaleKeys.app_name.tr(),
          supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              primaryColor: Color(0xFF263238),
              // primaryColor: Color.fromRGBO(146, 40, 105, 1),
              // ignore: deprecated_member_use
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
          initialRoute: SplashScreen.routeName,
          onGenerateRoute: AppRoutes.generateRoute,

          onUnknownRoute: (settings) {
            return MaterialPageRoute(builder: (ctx) => Login());
          },

          // home: Login(),
        ));
  }
}
